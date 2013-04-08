<?php
# This function reads your DATABASE_URL configuration automatically set by Heroku
# the return value is a string that will work with pg_connect
function pg_connection_string() {
  // we will fill this out next
}
 
# Establish db connection
$db = pg_connect(pg_connection_string());
if (!$db) {
   echo "Database connection error."
   exit;
}
 
$result = pg_query($db, "SELECT statement goes here");
?><!doctype html>
<html lang="en">

  <head>

    <meta charset="utf-8"/>

    <meta name="keywords" content="matthew mcvickar, mcvickar" />
    <meta name="description" content="Musician, DJ, and web designer living and working in Honolulu, Hawaii." />
    
    <link rel="shortcut icon" href="/favicon.ico" />

    <meta name="google-site-verification" content="2mkoImNpjg7cn6NyPYdXHUOAHZH2dRXlifrX_t6czf4" />

    <title>Matthew McVickar</title>

    <style>
    body
    {
      background: #fff;
    }
    
    ::-moz-selection { background: #0da1ff; color: #fff; text-shadow: none; }
    ::selection { background: #0da1ff; color: #fff; text-shadow: none; }

    a img
    {
      border: 0;
      line-height: 0;
      margin: 0;
      padding: 0;
    }

    a
    {
      color: #0da1ff;
      text-decoration: none;
      -webkit-transition: all .15s ease-in-out;
      -moz-transition: all .15s ease-in-out;
      -o-transition: all .15s ease-in-out;
      transition: all .15s ease-in-out;
    }

    a:hover
    {
      color: #333;
    }

    .content
    {
      position: relative;
    }

    .clear
    {
      clear: both;
    }

    body
    {
      font-family: Helvetica, Arial, sans-serif;
      font-size: 16px;
      line-height: 1.5625em;
      margin: 2em auto 0 auto;
    }

    .container
    {
      margin: 0 auto;
      width: 960px;
    }
    
    .intro
    {
      margin-top: 1em;
    }

    .about
    {
      float: left;
      margin: .15em 0 .5em 0;
      width: 760px;
    }

    .about p
    {

      line-height: 1.7;
      margin: .5em 0 0 0;
      text-align: justify;
    }

    h1
    {
      color: #999;
      font-size: 2.1em;
      font-weight: normal;
      line-height: 1.3;
      text-align: left;
      margin: 1em 0 .25em 0;
    }

    h1 a
    {
      background: transparent;
      color: #333;
      padding: 0;
      text-decoration: none;
    }

    h2
    {
      color: #ccc;
      float: left;
      font-size: 2em;
      font-weight: normal;
      margin: .4em 0;
      width: 190px;
    }

    ul
    {
      float: left;
      list-style: none;
      margin: 0;
      padding: 1em 0 0 0;
      width: 190px;
    }

    li
    {
      color: #c0c0c0;
      float: left;

      line-height: 1.4;
      margin: 0 0 0 -6px;
      padding: 4px;
      width: 190px;
    }

    li a
    {
      display: block;
      font-weight: normal;
    }

    hr
    {
      background: #ddd;
      color: #ddd;
      border: 0;
      height: 2px;
      margin: 1.75em 0 1.5em;
    }

    .past
    {
      opacity: .25;
      -webkit-transition: all .15s ease-in-out;
      -moz-transition: all .15s ease-in-out;
      -o-transition: all .15s ease-in-out;
      transition: all .15s ease-in-out;
    }

    .past:hover
    {
      opacity: 1;
    }
    </style>
  </head>

  <body>

    <div class="container">

      <h1><a href="/">Matthew McVickar</a> works on music and the web in Hawaii.</h1>

      <div class="clear"></div>

      <div class="content intro">
        <h2>Hello</h2>
        <div class="about">
          <img src="data:image/gif;base64,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" alt="a photograph of me" title="Me, Matthew McVickar" style="float: right; margin: 1em 0 0 1.5em; height: 65px;" />
          <p>I make music with <a href="http://clonesofthequeen.com">Clones of the Queen</a> and as <a href="http://welwing.bandcamp.com">Welwing</a> and make websites with <a href="http://ocupop.com/">Ocupop</a> and independently. I was born in 1985, raised on Cape Cod, studied Japanese language and literature at UMass Amherst and in Japan, and moved to Honolulu in 2007. I am obsessed with music and the internet. I like reading, cycling, swimming, and video games. I <a href="https://twitter.com/matthewmcvickar">tweet</a>, I <a href="mailto:matthew@matthewmcvickar.com">email</a>.</p>
        </div>
        <div class="clear"></div>
      </div>
    </div>

    <div class="container">
      <div class="content">

        <hr />

        <h2>Things</h2>
        <ul>
          <li><a href="/2012-09-07-rain" rel="me">Rainy Day</a></li>
        </ul>
        <ul>
          <li><a href="/2012-10-31-halloween">Happy Halloween</a></li>
        </ul>
        <div class="clear"></div>

        <hr />

        <h2>Projects</h2>
        <ul>
          <li>Music</li>
          <li><a href="http://clonesofthequeen.com" rel="me">Clones of the Queen</a></li>
          <li><a href="http://welwing.bandcamp.com"rel="me">Welwing</a></li>
        </ul>
        <ul>
          <li>Photography</li>
          <li><a href="http://www.flickr.com/photos/matthewmcvickar/sets/72157594153681931/">Cameramail</a></li>
          <li><a href="http://www.flickr.com/photos/matthewmcvickar/">Flickr</a></li>
        </ul>
        <ul>
          <li>Web</li>
          <li><a href="https://github.com/matthewmcvickar/taskpaper-tiles">TaskPaper Tiles</a></li>
          <li><a href="http://soundslikethe.tumblr.com">Sounds Like The</a></li>
          <!--<li><a href="http://idgosee.com">I&rsquo;d Go See</a></li>-->
          <!--<li><a href="http://rsrvoir.com">Rsrvoir</a></li>-->
        </ul>
<!--
        <ul>
          <li>Art</li>
          <li><a href="/drawings">Drawings</a></li>
        </ul>
-->
        <div class="clear"></div>

        <hr />

        <h2>Work</h2>
        <ul>
          <li>Employed By</li>
          <li><a href="http://ocupop.com/">Ocupop</a></li>
        </ul>
        <ul>
          <li>Freelancing</li>
          <li><a href="http://antlersmusic.com/">The Antlers</a></li>
          <li><a href="http://unknownmortalorchestra.com/">UMO</a></li>
          <li><a href="http://posthocmanagement.com/">Post Hoc Management</a></li>
        </ul>
        <ul>
          <li>&nbsp;</li>
          <li><a href="http://barackobamadesign.com/">Al Rotches</a></li>
          <li><a href="http://live.gourmet.com/">Gourmet Live</a></li>
          <li><a href="http://twosyllablerecords.com/">twosyllable Records</a></li>
        </ul>
        <ul>
          <li>&nbsp;</li>
          <li><a href-"http://hmfamilylaw.com/">Hartley &amp; McGehee</a></li>
          <li><a href="http://fluxhawaii.com/">FLUX Hawaii</a></li>
          <li><a href="http://thevalueofhawaii.com/">The Value of Hawai&lsquo;i</a></li>
<!-- 
          <li><a href="http://chuckjamesmusicstudio.com/">Chuck James Music Studio</a></li>
-->
        </ul>
        <div class="clear"></div>

        <hr />

        <h2>Elsewhere</h2>
        <ul>
          <li><a href="http://twitter.com/matthewmcvickar" rel="me">Twitter</a></li>
          <li><a href="http://matthewmcvickar.tumblr.com/" rel="me">Tumblr</a></li>
        </ul>
        <ul>
          <li><a href="http://facebook.com/matthewmcvickar" rel="me">Facebook</a></li>
          <li><a href="http://www.linkedin.com/in/matthewmcvickar" rel="me">LinkedIn</a></li>
        </ul>
        <ul>
          <li><a href="http://mlkshk.com/user/matthewmcvickar" rel="me">mlkshk</a></li>
          <li><a href="http://last.fm/user/MatthewMcVickar/" rel="me">Last.fm</a></li>
        </ul>
        <ul>
          <li><a href="http://pinboard.in/u:matthewmcvickar" rel="me">Pinboard</a></li>
        </ul>
        <div class="clear"></div>

<!--
        <hr />

        <div class="past">
          <h2>Past</h2>
          <ul>
            <li>Photography</li>
            <li><a href="photos/butterfield_bunch/">The Butterfield Bunch (2007)</a></li>
            <li><a href="photos/pumpkins/">Carve-a-Thon (2007)</a></li>
            <li><a href="photos/murder_mystery_party/">Murder Mystery Party (2007)</a></li>
            <li><a href="photos/ryans_night/">Ryan&rsquo;s Night (2007)</a></li>
            <li><a href="photos/zach_wizard/">Zach, Wizard (2007)</a></li>
            <li><a href="photos/night_lights/harwich">Night Lights (2007)</a></li>
            <li><a href="photos/japanoramas/">Japanoramas (2006)</a></li>
          </ul>
          <ul>
            <li>Music</li>
            <li><a href="/youarelisteningtohawaii">You Are Listening to Hawaii (2010)</a></li>
            <li><a href="music/a_month_without/">A Month Without Music (2008)</a></li>
            <li><a href="music/best_of_2008/">Best of 2008</a></li>
            <li><a href="music/best_of_2007/">Best of 2007</a></li>
            <li><a href="http://soundcloud.com/matthewmcvickar/sets/lilt">Lilt (2005)</a></li>
          </ul>
          <ul>
            <li>Travel Journals</li>
            <li><a href="journals/to_hawaii/">To Hawaii (Summer 2007)</a></li>
            <li><a href="journals/japan/2005-2006/">Japan (2005&ndash;2006)</a></li>
          </ul>
 -->
          <div class="clear"></div>
        </div>
      </div>

    </div>

  </body>

  <script type="text/javascript">
  var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
  document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
  </script>
  <script type="text/javascript">
  try {
  var pageTracker = _gat._getTracker("UA-2466767-4");
  pageTracker._trackPageview();
  } catch(err) {}
  </script>

</html>
