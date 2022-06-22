from theHarvester.discovery.constants import *
from theHarvester.parsers import myparser
import asyncio


class SearchGoogle:

    def __init__(self, word, limit, start):
        self.word = word
        self.results = ""
        self.totalresults = ""
        self.server = 'www.google.com'
        self.dorks = []
        self.links = []
        self.database = 'https://www.google.com/search?q='
        self.quantity = '100'
        self.limit = limit
        self.counter = start
        self.proxy = False

    async def do_search(self):
        # Do normal scraping.
        urly = 'http://' + self.server + '/search?num=' + self.quantity + '&start=' + str(
            self.counter) + '&hl=en&meta=&q=%40\"' + self.word + '\"'
        try:
            headers = {'User-Agent': googleUA}
            resp = await AsyncFetcher.fetch_all([urly], headers=headers, proxy=self.proxy)
        except Exception as e:
            print(e)
        self.results = resp[0]
        searched = await search(self.results)
        if searched:
            try:
                self.results = await google_workaround(urly)
                if isinstance(self.results, bool):
                    print('Google is blocking your ip and the workaround, returning')
                    return
            except Exception as e:
                print(e)
                # google blocked, no useful result
                return
        await asyncio.sleep(get_delay())
        self.totalresults += self.results

    async def do_search_profiles(self):
        urly = 'http://' + self.server + '/search?num=' + self.quantity + '&start=' + str(
            self.counter) + '&hl=en&meta=&q=site:www.google.com%20intitle:\"Google%20Profile\"%20\"Companies%20I%27ve%20worked%20for\"%20\"at%20' + self.word + '\"'
        try:
            headers = {'User-Agent': googleUA}
            resp = await AsyncFetcher.fetch_all([urly], headers=headers, proxy=self.proxy)
        except Exception as e:
            print(e)
        self.results = resp[0]
        if await search(self.results):
            try:
                self.results = await google_workaround(urly)
                if isinstance(self.results, bool):
                    print('Google is blocking your ip and the workaround, returning')
                    return
            except Exception:
                # google blocked, no useful result
                return
        await asyncio.sleep(get_delay())
        self.totalresults += self.results

    async def get_emails(self):
        rawres = myparser.Parser(self.totalresults, self.word)
        return await rawres.emails()

    async def get_hostnames(self):
        rawres = myparser.Parser(self.totalresults, self.word)
        return await rawres.hostnames()

    async def get_files(self):
        rawres = myparser.Parser(self.totalresults, self.word)
        return rawres.fileurls(self.files)

    async def get_profiles(self):
        rawres = myparser.Parser(self.totalresults, self.word)
        return rawres.profiles()

    async def process(self, google_dorking, proxy=False):
        self.proxy = proxy
        if google_dorking is False:
            while self.counter <= self.limit and self.counter <= 1000:
                await self.do_search()
                print(f'\tSearching {self.counter} results.')
                self.counter += 100
        else:  # Google dorking is true.
            self.counter = 0  # Reset counter.
            print('\n')
            print('[-] Searching with Google Dorks: ')
            await self.googledork()  # Call Google dorking method if user wanted it!

    async def process_profiles(self):
        while self.counter < self.limit:
            await self.do_search_profiles()
            await asyncio.sleep(get_delay())
            self.counter += 100
            print(f'\tSearching {self.counter} results.')

    async def append_dorks(self):
        # Wrap in try-except in case filepaths are messed up.
        try:
            with open('/etc/theHarvester/wordlists/dorks.txt', 'r') as fp:
                self.dorks = [dork.strip() for dork in fp]
        except FileNotFoundError:
            try:
                with open('/usr/local/etc/theHarvester/wordlists/dorks.txt', 'r') as fp:
                    self.dorks = [dork.strip() for dork in fp]
            except FileNotFoundError:
                try:
                    with open('wordlists/dorks.txt', 'r') as fp:
                        self.dorks = [dork.strip() for dork in fp]
                except FileNotFoundError as error:
                    print(error)

    async def construct_dorks(self):
        # Format is: site:targetwebsite.com + space + inurl:admindork
        colon = '%3A'
        plus = '%2B'
        space = '+'
        period = '%2E'
        double_quote = '%22'
        asterick = '%2A'
        left_bracket = '%5B'
        right_bracket = '%5D'
        question_mark = '%3F'
        slash = '%2F'
        single_quote = '%27'
        ampersand = '%26'
        left_peren = '%28'
        right_peren = '%29'
        pipe = '%7C'
        # Format is google.com/search?q=dork+space+self.word
        self.links = tuple(
            self.database + str(dork).replace(':', colon).replace('+', plus).replace('.', period).replace('"',
                                                                                                          double_quote)
            .replace('*', asterick).replace('[', left_bracket).replace(']', right_bracket)
            .replace('?', question_mark).replace(' ', space).replace('/', slash).replace("'", single_quote)
            .replace('&', ampersand).replace('(', left_peren).replace(')', right_peren).replace('|',
                                                                                                pipe) + space + self.word
            for dork in self.dorks)

    async def googledork(self):
        await self.append_dorks()  # Call functions to create list.
        await self.construct_dorks()
        await self.send_dorks()

    async def send_dorks(self):  # Helper function to minimize code reusability.
        headers = {'User-Agent': googleUA}
        # Get random user agent to try and prevent google from blocking IP.
        for num in range(len(self.links)):
            try:
                if num % 10 == 0 and num > 0:
                    print(f'\tSearching through {num} results')
                link = self.links[num]
                req = await AsyncFetcher.fetch_all([link], headers=headers, proxy=self.proxy)
                self.results = req[0]
                if await search(self.results):
                    try:
                        self.results = await google_workaround(link)
                        if isinstance(self.results, bool):
                            print('Google is blocking your ip and the workaround, returning')
                            return
                    except Exception:
                        # google blocked, no useful result
                        return
                await asyncio.sleep(get_delay())
                self.totalresults += self.results
            except Exception as e:
                print(f'\tException Occurred {e}')
