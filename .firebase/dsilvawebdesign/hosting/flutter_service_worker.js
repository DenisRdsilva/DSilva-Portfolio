'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "4a84ab80f733a1d6b4d5ae6165a4b0f3",
"assets/AssetManifest.bin.json": "3d8f3a80914fb8e900bf0a215ab71563",
"assets/AssetManifest.json": "aa16d327125dc5425a7925016a41ed5d",
"assets/assets/back.png": "afecde0397a2d9811aaa9ad22ff82a11",
"assets/assets/back1.png": "57c75c539a65fef41245850e720b396c",
"assets/assets/fonts/Raleway-Bold.ttf": "21c82294041b1504a5cbe4f566c8acd6",
"assets/assets/fonts/Raleway-Italic.ttf": "5579b5fda3005b7d349336b3425b9f89",
"assets/assets/fonts/Raleway-Regular.ttf": "d95649da7dfb965a289ac29105ce8771",
"assets/assets/me.jpg": "2be978f2696cfd3581a79d5a1ba50bc7",
"assets/assets/projects/books.jpeg": "66666b5d1a908aded73665ee9d46a0f6",
"assets/assets/projects/booksmob.jpeg": "d346c46c4796908035421b884b154ba8",
"assets/assets/projects/calc.jpeg": "6b07490c85c050403988781d0d194281",
"assets/assets/projects/calcmob.jpeg": "920e6fd9f34ff2627a741ec0e2fe3306",
"assets/assets/projects/citiesblog.jpeg": "8b6c20387b02142d9d802f84a951d0da",
"assets/assets/projects/citiesblogmob.jpeg": "2bc191e0b7b69fbd0a10a95d596aea97",
"assets/assets/projects/crystalshop.jpeg": "6c091798b3b247c4e78f45f230eb9e79",
"assets/assets/projects/crystalshopmob.jpeg": "71691732e88fd7067eddf6a6e2153262",
"assets/assets/projects/danieloli.jpeg": "e2c01878edea6718c478c59f8a2520d9",
"assets/assets/projects/danielolimob.jpeg": "6213601b4a5d3c5680f6381d3e699461",
"assets/assets/projects/pex.jpeg": "790c1cd99b3033534e31e3d03915c6e6",
"assets/assets/projects/pexmob.jpeg": "a73b573c5b207e4a80b3ed4dc0a458cc",
"assets/assets/projects/pokedex.jpeg": "0dc188e97ff7859fa8ae4ac5e05730eb",
"assets/assets/projects/pokedexmob.jpeg": "b5aac91aef7b635e789271e043467d00",
"assets/assets/projects/psialice.jpeg": "b51e984eb7289a97c1c3686515c8feb0",
"assets/assets/projects/psialicemob.jpeg": "b0524df973146bc179d06a239973cf45",
"assets/FontManifest.json": "128381ed47c9afc4e969d93a9138961f",
"assets/fonts/MaterialIcons-Regular.otf": "9605aa6ba40853cd3a6e4dacca66b139",
"assets/NOTICES": "feb4a4c9c49a533a1eb4e29709f525e6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "7737f5fc722b6a040ac15271ea8d92fb",
"canvaskit/canvaskit.js.symbols": "8b59bb301fc2b1136f25606382f2ed6c",
"canvaskit/canvaskit.wasm": "2bb409a4a670950421c0d3cd973c6cc0",
"canvaskit/chromium/canvaskit.js": "2f82009588e8a72043db753d360d488f",
"canvaskit/chromium/canvaskit.js.symbols": "5573e55905729e79f52db673cb8da1ce",
"canvaskit/chromium/canvaskit.wasm": "89b52623ef09fc18418ba5e92d92bade",
"canvaskit/skwasm.js": "099f00a255e1b1f33ba268145da4d8d8",
"canvaskit/skwasm.js.symbols": "3de29dc1934313ba10e7131c64b8049f",
"canvaskit/skwasm.wasm": "753caf3fee81910807748eb38985a697",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.ico": "58f0dbfb1d9812454bb4ab07b180587b",
"flutter.js": "4af2b91eb221b73845365e1302528f07",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b58aeb0d55d67c4d2824c68b427ae6c4",
"/": "b58aeb0d55d67c4d2824c68b427ae6c4",
"main.dart.js": "8e1a5e2333f2ae19c64fa415315dd898",
"manifest.json": "e463b3947f288bb40c5e87c67716a736",
"version.json": "1d3fa036e39f58f2533921dc98aa93c2"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
