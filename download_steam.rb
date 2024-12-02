#!/usr/bin/env ruby
require 'uri'
require 'net/http'
require 'json'

# games = [
# 1031080,
# 1054950,
# 1065070,
# 1104600,
# 1116170,
# 1120330,
# 1138250,
# 1143910,
# 1179580,
# 1219240,
# 1226670,
# 1255020,
# 1259760,
# 1266210,
# 1274210,
# 1275550,
# 1281490,
# 1313290,
# 1358440,
# 1374860,
# 1384060,
# 1386750,
# 1412990,
# 1418390,
# 1418750,
# 1421290,
# 1432850,
# 1439630,
# 1461910,
# 1466230,
# 1476400,
# 1481170,
# 1483190,
# 1484940,
# 1492750,
# 1494560,
# 1521360,
# 1534720,
# 1536120,
# 1538710,
# 1548180,
# 1555980,
# 1561340,
# 1579390,
# 1585180,
# 1619580,
# 1626350,
# 1634360,
# 1638160,
# 1656930,
# 1670810,
# 1671360,
# 1671740,
# 1682290,
# 1682690,
# 1689340,
# 1690190,
# 1692550,
# 1705140,
# 1716310,
# 1717730,
# 1733250,
# 1742360,
# 1769830,
# 1775220,
# 1778050,
# 1782120,
# 1796580,
# 1803600,
# 1805110,
# 1818480,
# 1822240,
# 1822660,
# 1830430,
# 1830970,
# 1835240,
# 1839980,
# 1841190,
# 1844120,
# 1848600,
# 1859390,
# 1866320,
# 1875060,
# 1876850,
# 1877650,
# 1879950,
# 1919600,
# 1920720,
# 1921480,
# 1929290,
# 1929860,
# 1932210,
# 1933370,
# 1937880,
# 1948490,
# 1951780,
# 1952690,
# 1953100,
# 1963570,
# 1969170,
# 1973310,
# 1984190,
# 1989120,
# 1999140,
# 2000210,
# 2009160,
# 2026820,
# 2052160,
# 2058070,
# 2066950,
# 2067430,
# 2067890,
# 2071430,
# 2092840,
# 2093580,
# 2096780,
# 2096860,
# 2097570,
# 2097950,
# 2109060,
# 2111190,
# 2113850,
# 2118420,
# 2120070,
# 2121450,
# 2131010,
# 2132560,
# 2137750,
# 2137760,
# 2138410,
# 2142420,
# 2146380,
# 2163330,
# 2184770,
# 2191720,
# 2219390,
# 2219450,
# 2221530,
# 2226280,
# 2226430,
# 2229030,
# 2234140,
# 2239710,
# 2244630,
# 2244700,
# 2245180,
# 2248890,
# 2250330,
# 2253300,
# 2255380,
# 2282650,
# 2282890,
# 2286070,
# 2294160,
# 2302340,
# 2303500,
# 2304590,
# 2311990,
# 2313010,
# 2317180,
# 2318800,
# 2328180,
# 2332180,
# 2332240,
# 2334400,
# 2337860,
# 2341620,
# 2342150,
# 2351860,
# 2352850,
# 2354580,
# 2355150,
# 2360000,
# 2365790,
# 2366060,
# 2368030,
# 2371060,
# 2387040,
# 2387460,
# 2387740,
# 2390230,
# 2393920,
# 2399930,
# 2400510,
# 2412110,
# 2414140,
# 2419720,
# 2422210,
# 2424480,
# 2424730,
# 2427050,
# 2427070,
# 2428800,
# 2430170,
# 2436660,
# 2437330,
# 2438180,
# 2439500,
# 2447260,
# 2453610,
# 2455430,
# 2455710,
# 2458430,
# 2463690,
# 2465930,
# 2468630,
# 2470790,
# 2475620,
# 2476350,
# 2484130,
# 2485430,
# 2488450,
# 2492410,
# 2499330,
# 2506100,
# 2506810,
# 2506900,
# 2510960,
# 2522120,
# 2535560,
# 2537470,
# 2550840,
# 2560210,
# 2568730,
# 2573840,
# 2576200,
# 2580020,
# 2582400,
# 2584510,
# 2585830,
# 2586000,
# 2593320,
# 2600140,
# 2601810,
# 2602540,
# 2603020,
# 2608100,
# 2610650,
# 2614580,
# 2616750,
# 2617090,
# 2631450,
# 2632240,
# 2638610,
# 2650730,
# 2655470,
# 2664120,
# 2666510,
# 2666920,
# 2668000,
# 2669500,
# 2671590,
# 2680550,
# 2681730,
# 2682270,
# 2686020,
# 2689930,
# 2693940,
# 2695710,
# 2696550,
# 2710040,
# 2711030,
# 2720920,
# 2724220,
# 2728260,
# 2736690,
# 2745660,
# 2748340,
# 2753540,
# 2757500,
# 2761860,
# 2768130,
# 2768420,
# 2776770,
# 2781420,
# 2782880,
# 2783370,
# 2783850,
# 2787680,
# 2790020,
# 2802490,
# 2805850,
# 2810190,
# 2817960,
# 2824880,
# 2827570,
# 2828320,
# 2830030,
# 2830480,
# 2834320,
# 2834600,
# 2834830,
# 2835460,
# 2836860,
# 2842190,
# 2848800,
# 2850490,
# 2850620,
# 2860020,
# 2876160,
# 2876610,
# 2877770,
# 2882830,
# 2908050,
# 2908830,
# 2924310,
# 2925520,
# 2934480,
# 2938870,
# 2945150,
# 2945950,
# 2949270,
# 2950400,
# 2954920,
# 2958140,
# 2958950,
# 2962940,
# 2963210,
# 2967670,
# 2972760,
# 2973340,
# 2977820,
# 2979810,
# 2982340,
# 2989830,
# 2994240,
# 2995450,
# 2998990,
# 2999500,
# 2999540,
# 3011060,
# 3013460,
# 3017130,
# 3026450,
# 3032830,
# 3033600,
# 3036350,
# 3036440,
# 3042120,
# 3045200,
# 3048330,
# 3048840,
# 3053870,
# 3066310,
# 3066680,
# 3078120,
# 3087810,
# 3090810,
# 3093050,
# 3096140,
# 3096260,
# 3100310,
# 3100650,
# 3107530,
# 3108230,
# 3109460,
# 3118010,
# 3127570,
# 3128280,
# 3130170,
# 3135610,
# 3136380,
# 3141860,
# 3146780,
# 3147370,
# 3153020,
# 3158810,
# 3160260,
# 3160540,
# 3166200,
# 3167970,
# 3172160,
# 3178820,
# 3180290,
# 3181960,
# 3195450,
# 3195580,
# 3198700,
# 3202430,
# 3205170,
# 3216150,
# 3219010,
# 3223000,
# 3228580,
# 3234850,
# 3254380,
# 3256890,
# 3257150,
# 3258580,
# 3258590,
# 3264490,
# 3266590,
# 3268730,
# 3274390,
# 3282050,
# 3290400,
# 3292620,
# 3292980,
# 3295530,
# 3301000,
# 3303290,
# 3307410,
# 3308330,
# 3309380,
# 3321280,
# 3324260,
# 3336460,
# 3343360,
# 3346520,
# 3351080,
# 458430,
# 570950,
# 633080,
# 670510,
# 672420,
# 726840,
# 756600,
# 782260,
# 789940,
# 895760,
# 968800]

games = [1002260, 1179890, 1267210, 1407640, 1462030, 1574870, 1660080, 1740150, 1789490, 1810050, 1812910, 1830320, 1858950, 1865930, 1870700, 1872410, 2001110, 2010010, 2012190, 2073910, 2074630, 2103950, 2124300, 2166890, 2195410, 2202650, 2207230, 2239130, 2289390, 2300160, 2332970, 2333510, 2337990, 2342780, 2424010, 2443900, 2462060, 2466790, 2613890, 2619650, 2633540, 2637080, 2643010, 2659600, 2681270, 2758190, 2794160, 2807150, 2822980, 2851240, 2867470, 2959610, 2979860, 3001730, 3005120, 3014930, 3034750, 3062330, 3091260, 3138780, 3194390, 3245890, 3250330, 3264420, 3295350, 3297040, 3299160, 3303780, 3355070, 757940]

games.each do |game|
  p game
  uri = URI("https://store.steampowered.com/api/appdetails?appids=#{game}&key=#{ENV['STEAM_KEY']}")
  res = Net::HTTP.get_response(uri)
  if res.is_a?(Net::HTTPSuccess)
    data = JSON.parse(res.body)
    gd = data[game.to_s]['data']

    slug = gd['name'].gsub(' ','_').delete('^a-zA-Z0-9_')

    File.open("_games/#{game}-#{slug}.markdown","w+") do |out|
      out.puts <<~"DATA"
      ---
      title: #{gd['name'].to_json}
      description: #{gd['short_description'].to_json}
      image: #{gd['header_image'].to_json}
      capsule_image: #{gd['capsule_image'].to_json}
      categories: game
      steamid: #{game}
      screenshots: #{gd['screenshots'].to_json}
      movies: #{gd['movies'].to_json}
      genres: #{(gd['genres'] || []).map{|g| g['description']}.to_json}
      steam_categories: #{(gd['categories']||[]).map{|g| g['description']}.to_json}
      platforms: #{gd['platforms'].to_json}
      developers: #{gd['developers'].to_json}
      publishers: #{gd['publishers'].to_json}
      release_date: #{gd['release_date'].to_json}
      content_warning: #{gd['content_descriptors'].to_json}
      about: #{gd['about_the_game'].to_json}
      detailed_description: #{gd['detailed_description'].to_json}
      languages: #{gd['supported_languages'].to_json}
      reviews: #{gd['reviews'].to_json}
      support_info: #{gd['support_info'].to_json}
      ---

      DATA
    end
  else
    STDERR.puts "Could not download data for #{game}"
  end
end
