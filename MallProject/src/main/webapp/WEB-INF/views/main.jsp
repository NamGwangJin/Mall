<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Slideshow</title>
<link rel="stylesheet" href="resources/css/main.css">
<style>
  /* 슬라이드 컨테이너 */
  #slideShow {
    width: 1500px;
    height: 600px;
    position: relative;
    margin: 50px auto;
    overflow: hidden;
  }
  /* 동영상 컨테이너 */
  .video-container {
    width: 100%;
    height: 100%;
    position: relative;
  }
  /* 동영상 */
  #video {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
</style>
</head>
<body>
  <div id="slideShow">
    <div class="video-container">
      <video id="video" controls autoplay muted loop>
        <source src="/video/LE SSERAFIM UNFORGIVEN .mp4" type="video/mp4">
      </video>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <script src="resources/js/slideShow.js"></script>
</body>
</html>
