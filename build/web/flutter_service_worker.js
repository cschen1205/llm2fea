'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "206af19e37b3d00c1826a222efd50df7",
"assets/AssetManifest.bin.json": "ca11d9cd8b1a9c6dda50ade9bdb3528e",
"assets/AssetManifest.json": "74685d0e81265ae8aed59281ea219658",
"assets/assets/airplane/airplane1.glb": "93e3e81e8c693f2bbbbccdeebf747bbd",
"assets/assets/airplane/airplane1.png": "54f63edddf41ae67b0da756984dc1e2e",
"assets/assets/airplane/airplane1_info.txt": "997959bbfd09393222c272ce92daf736",
"assets/assets/airplane/airplane2.glb": "575c38d0678501ef299831e01e584d71",
"assets/assets/airplane/airplane2.png": "40c485c0b2a15dc0c87274f3e193d526",
"assets/assets/airplane/airplane2_info.txt": "8484bf31a41e90412ec8935898a3bf11",
"assets/assets/airplane/airplane3.glb": "9eadf15ccd5bacaf2c9db0bf97fc39a7",
"assets/assets/airplane/airplane3.png": "78a8cd699717407a3f7f57542c90bec9",
"assets/assets/airplane/airplane3_info.txt": "60d117b7b1a4315f1d6c9fa118f5c0cd",
"assets/assets/airplane/airplane4.glb": "6c2e373156cdb4b013354b51d31880cb",
"assets/assets/airplane/airplane4.png": "3a50f547a893cc448ffadf7cf18edcba",
"assets/assets/airplane/airplane4_info.txt": "40815c8890bee31bc1500968ec7dd664",
"assets/assets/airplane/airplane5.glb": "fc1818d998fea4ba086f518ac47df47c",
"assets/assets/airplane/airplane5.png": "e2d884532987f95b2e3827de91d8a3ef",
"assets/assets/airplane/airplane5_info.txt": "055efc968eaca24ff081551fe022727f",
"assets/assets/airplane/airplane6.glb": "a8f7fe39d2fe7c1147b0d8dc2b185e4b",
"assets/assets/airplane/airplane6.png": "e4c52d38b1f21ec79276086d13bd3219",
"assets/assets/airplane/airplane6_info.txt": "4f917b25a7117dfbd15e658d4602a13b",
"assets/assets/car/car1.glb": "4a9427fc4a56ec6b091fe88037d100dd",
"assets/assets/car/car1.png": "6cb882adc2f782efed4ded3279cc7be8",
"assets/assets/car/car1_info.txt": "3303951b34002a07a4b5aa9c58c6ff83",
"assets/assets/car/car2.glb": "01fd090d630d51a92f94ebbea6ea844b",
"assets/assets/car/car2.png": "0c700565b8bb78410cfd1ee7e38b0aae",
"assets/assets/car/car2_info.txt": "4d927938a3f35e8ffea1e00551c29a3d",
"assets/assets/car/car3.glb": "1e7273eb9c3c4a94065793f342bd3c6d",
"assets/assets/car/car3.png": "d88b2ef66b02ae16f3e0d58701284755",
"assets/assets/car/car3_info.txt": "92e4164b2f5dc5449d5bfe3a54e68403",
"assets/assets/car/car4.glb": "c51f05eeb77df9d8b2d2b88a41e91fb2",
"assets/assets/car/car4.png": "7e812e1fbeac22fde0391146865160ed",
"assets/assets/car/car4_info.txt": "71c2780e13a15d7c2266aa7f158272a8",
"assets/assets/car/car5.glb": "d0387ee66c6a26e8cd43a8b44ab1ea12",
"assets/assets/car/car5.png": "db28cda93b5ff1744b6c53b5da92c5d8",
"assets/assets/car/car5_info.txt": "33783499a4a80f537510d04dbc18de0c",
"assets/assets/car/car6.glb": "782a8af2d1841e6d56adecba5f2b645f",
"assets/assets/car/car6.png": "25d535b0b23c99dec2c55df5e28b977d",
"assets/assets/car/car6_info.txt": "ab6cd341fc93f7a6441176c3a480067f",
"assets/assets/images/background.png": "132928dd7c2096113dc3e968f964bb6f",
"assets/assets/images/logo.png": "18742067601910b680d5844efa2f8286",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "d6f50f2c18e4757f47bc27055675f606",
"assets/NOTICES": "0bb70f92ecd65b236e8f723ea22221ad",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/model_viewer_plus/assets/model-viewer.min.js": "a9dc98f8bf360be897a0898a7395f905",
"assets/packages/model_viewer_plus/assets/template.html": "8de94ff19fee64be3edffddb412ab63c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "f6039b5d77411938c8f2d38a423715cd",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "3de077e049f5f772e9d8a581e92bdf89",
"icons/Icon-192.png": "c7d915b8734da6f9835f4708b11a8423",
"icons/Icon-512.png": "7ac4bf526b68013948e88b45f1931539",
"icons/Icon-maskable-192.png": "c7d915b8734da6f9835f4708b11a8423",
"icons/Icon-maskable-512.png": "7ac4bf526b68013948e88b45f1931539",
"index.html": "d68285b8d2267c7142091cf58edeed6d",
"/": "d68285b8d2267c7142091cf58edeed6d",
"main.dart.js": "49da4575f5c9b904252c20a09557f81b",
"manifest.json": "272d86325a96b2dfa1025b3bc65ca130",
"version.json": "c4ce404ce309bfd4d5d496eaf202ea6a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
