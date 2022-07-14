from theHarvester.lib.core import *
import re


class SearchOtx:

    def __init__(self, word):
        self.word = word
        self.totalhosts = set()
        self.totalips = set()
        self.proxy = False

    async def do_search(self):
        url = f'https://otx.alienvault.com/api/v1/indicators/domain/{self.word}/passive_dns'
        response = await AsyncFetcher.fetch_all([url], json=True, proxy=self.proxy)
        responses = response[0]
        dct = responses
        self.totalhosts: set = {host['hostname'] for host in dct['passive_dns']}
        # filter out ips that are just called NXDOMAIN
        self.totalips: set = {ip['address'] for ip in dct['passive_dns']
                              if re.match(r"^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$", ip['address'])}

    async def get_hostnames(self) -> set:
        return self.totalhosts

    async def get_ips(self) -> set:
        return self.totalips

    async def process(self, proxy=False):
        self.proxy = proxy
        await self.do_search()
