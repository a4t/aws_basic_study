## Private サーバでcurlを使って外のサーバーに繋いで見る
できない、エラーが返る
理由は外に出ていく経路がないため

```
$ curl yahoo.co.jp
curl: (7) Failed to connect to yahoo.co.jp port 80: Connection timed out
```

### Publicサーバではできる

```
$ curl yahoo.co.jp
<!doctype html public "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html><head><title>Yahoo - 301 Moved Permanently</title><style>
/* nn4 hide */
/*/*/
body {font:small/1.2em arial,helvetica,clean,sans-serif;font:x-small;text-align:center;}table {font-size:inherit;font:x-small;}
html>body {font:83%/1.2em arial,helvetica,clean,sans-serif;}input {font-size:100%;vertical-align:middle;}p, form {margin:0;padding:0;}
p {padding-bottom:6px;margin-bottom:10px;}#doc {width:48.5em;margin:0 auto;border:1px solid #fff;text-align:center;}#ygma {text-align:right;margin-bottom:53px}
#ygma img {float:left;}#ygma div {border-bottom:1px solid #ccc;padding-bottom:8px;margin-left:152px;}#bd {clear:both;text-align:left;width:75%;margin:0 auto 20px;}
h1 {font-size:135%;text-align:center;margin:0 0 15px;}legend {display:none;}fieldset {border:0 solid #fff;padding:.8em 0 .8em 4.5em;}
form {position:relative;background:#eee;margin-bottom:15px;border:1px solid #ccc;border-width:1px 0;}
#s1p {width:15em;margin-right:.1em;}
form span {position:absolute;left:70%;top:.8em;}form a {font:78%/1.2em arial;display:block;padding-left:.8em;white-space:nowrap;background: url(http://l.yimg.com/a/i/s/bullet.gif) no-repeat left center;}
form .sep {display:none;}.more {text-align:center;}#ft {padding-top:10px;border-top:1px solid #999;}#ft p {text-align:center;font:78% arial;}
/* end nn4 hide */
</style></head>
<body><div id="doc">
<div id="ygma"><a href="http://us.rd.yahoo.com/301/*http://www.yahoo.com"><img src=http://l.yimg.com/a/i/yahoo.gif width=147 height=31 border=0 alt="Yahoo"></a><div><a href="http://us.rd.yahoo.com/301/*http://www.yahoo.com">Yahoo</a> - <a href="http://us.rd.yahoo.com/301/*http://help.yahoo.com">Help</a></div></div><div id="bd"><p>The document has moved <a href="http://www.yahoo.co.jp/">here</a>.</p>
<p>Please check the URL for proper spelling and capitalization. If
you're having trouble locating a destination on Yahoo, try visiting the
<strong><a
href="http://us.rd.yahoo.com/301/*http://www.yahoo.com">Yahoo home
page</a></strong> or look through a list of <strong><a
href="http://us.rd.yahoo.com/301/*http://docs.yahoo.com/docs/family/more/">Yahoo's
online services</a></strong>. Also, you may find what you're looking for
if you try searching below.</p>
<form name="s1" action="http://us.rd.yahoo.com/301/*-http://search.yahoo.com/search"><fieldset>
<legend><label for="s1p">Search the Web</label></legend>
<input type="text" size=30 name="p" id="s1p" title="enter search terms here">
<input type="submit" value="Search">
<span><a href="http://us.rd.yahoo.com/301/*http://search.yahoo.com/search/options?p=">advanced search</a> <span class=sep>|</span> </span>
</fieldset></form>
<p class="more">Please try <strong><a href="http://us.rd.yahoo.com/301/*http://help.yahoo.com">Yahoo Help Central</a></strong> if you need more assistance.</p>
</div><div id="ft"><p>Copyright &copy; 2017 Yahoo Inc. All rights reserved. <a href="http://us.rd.yahoo.com/301/*http://privacy.yahoo.com">Privacy Policy</a> - <a href="http://us.rd.yahoo.com/301/*http://info.yahoo.com/legal/us/yahoo/utos/terms/">Terms of Service</a></p></div>
</div></body></html>
```

## PackageもInstallできない

```
$ sudo apt-get install -y nginx
sudo: unable to resolve host ip-192-168-120-26
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  fontconfig-config fonts-dejavu-core libfontconfig1 libgd3 libjbig0 libjpeg-turbo8 libjpeg8 libtiff5 libvpx3 libxpm4 libxslt1.1 nginx-common nginx-core
Suggested packages:
  libgd-tools fcgiwrap nginx-doc ssl-cert
The following NEW packages will be installed:
  fontconfig-config fonts-dejavu-core libfontconfig1 libgd3 libjbig0 libjpeg-turbo8 libjpeg8 libtiff5 libvpx3 libxpm4 libxslt1.1 nginx nginx-common nginx-core
0 upgraded, 14 newly installed, 0 to remove and 0 not upgraded.
Need to get 2995 kB of archives.
After this operation, 9794 kB of additional disk space will be used.
0% [Connecting to ap-northeast-1.ec2.archive.ubuntu.com (54.199.23.9)]

ここで止まってしまう
```
