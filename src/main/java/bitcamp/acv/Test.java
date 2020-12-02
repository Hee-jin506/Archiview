package com.acv;

public class Test {
  
  public static void main(String[] args) {
    String str = "<li class=\"_list\" id=\"6703804\" data-json=\"{&quot;nid&quot;:0, &quot;imageNid&quot;:6703804,&quot;movieCode&quot;:189141,&quot;title&quot;:&quot;&quot;,&quot;imageDesc&quot;:&quot;\\uC601\\uD654 <\\uC0BC\\uC9C4\\uADF8\\uB8F9 \\uC601\\uC5B4\\uD1A0\\uC775\\uBC18> \\uC2A4\\uD2F8 \\uC774\\uBBF8\\uC9C0&quot;,&quot;width&quot;:768,&quot;height&quot;:432,&quot;gdid&quot;:&quot;080005ea_000000664abc&quot;,&quot;adult&quot;:&quot;false&quot;,&quot;fullImageUrl74px&quot;:&quot;https://movie-phinf.pstatic.net/20200929_113/1601360032918GP0Vh_JPEG/movie_image.jpg?type=n74_74_2&quot;,&quot;fullImageUrl665px&quot;:&quot;https://movie-phinf.pstatic.net/20200929_113/1601360032918GP0Vh_JPEG/movie_image.jpg?type=m665_443_2&quot;,&quot;fullImageUrl886px&quot;:&quot;https://movie-phinf.pstatic.net/20200929_113/1601360032918GP0Vh_JPEG/movie_image.jpg?type=m886_590_2&quot;,&quot;viewCount&quot;:22250, &quot;koreanMovieTitle&quot;:&quot;&quot;, &quot;movieYear&quot;:0, &quot;castName&quot;:&quot;&quot;, &quot;koreanPeopleName&quot;:&quot;&quot;,&quot;imageType&quot;:&quot;STILLCUT&quot;,&quot;typeSequence&quot;:17,&quot;addDate&quot;:&quot;1601359935000&quot; }\"><a href=\"#\" title=\"\" class=\"\"><img src=\"https://movie-phinf.pstatic.net/20200929_113/1601360032918GP0Vh_JPEG/movie_image.jpg?type=n74_74_2\" width=\"74\" height=\"74\" alt=\"STILLCUT\"></a><!-- N=a:pvi.img --></li>";
    
    System.out.println(str.split("fullImageUrl886px&quot;:&quot;")[1].split("/?")[0]);
    
  }

}
