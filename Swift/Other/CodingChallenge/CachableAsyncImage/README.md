# CachableAsyncImage

CachableAsyncImage is a SwiftUI View which can async load images and support cache.

You can declare an AsyncImage and pass URL and placeholder into it. When the image appears, ImageLoader will download the image. During the loading, the placeholder will be shown. Once the image is successfully downloaded, it will be stored in NSCache by NSURL-UIImage pair. Meanwhile, the image will display. If during the loading the image disappears, the loader will cancel the task of download. 
When the second time to load the image by the same URL, the image will be read in the cache and directly shown. 