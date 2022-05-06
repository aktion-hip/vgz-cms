<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]

    [#include "../include/functions.ftl"]
    [#include "../include/macros.ftl"]
    [#include "../include/head.ftl"]

    [#assign site = sitefn.site()!]
    [#assign theme = sitefn.theme(site)!]
    [#list theme.cssFiles as cssFile]
        [#if cssFile.conditionalComment?has_content]<!--[if ${cssFile.conditionalComment}]>[/#if]
          <link rel="stylesheet" type="text/css" href="${cssFile.link}" media="${cssFile.media}" />
        [#if cssFile.conditionalComment?has_content]<![endif]-->[/#if]
    [/#list]
    [#list theme.jsFiles as jsFile]
      <script src="${jsFile.link}"></script>
    [/#list]
  </head>
  <body class="vgz-homepage ${cmsfn.language()}">
    <div class="tm-page">
      [#include "../include/navigation.ftl"]
      [@vgzLogo true /]

      <!-- load background images -->
      [#list content.images as bgrImg ]
        <span data-vgz-bgr="${damfn.getAssetLink(bgrImg)}" class="vgz-home-hidden"></span>
      [/#list]

      <!-- Content - Screen-Height -->
      <div id="content" class="uk-section-muted home">
        <div style="min-height: calc(-60px + 100vh);" class="uk-background-norepeat uk-background-cover uk-background-center-center uk-section uk-flex uk-flex-middle vgz-home-div-bgr" uk-height-viewport="offset-top: true;">
          <div class="uk-width-1-1">
            <div class="tm-grid-expand uk-child-width-1-1 uk-grid-margin uk-grid uk-grid-stack" uk-grid>
              <div class="uk-first-column">
              </div>
            </div>
          </div>
        </div>
      </div>      

      [#include "../include/footer.ftl"]
    </<div>
    <!-- Alarm -->
    [#if content.alarm_text?has_content]
      <div id="modalInfo" class="uk-flex-top uk-modal uk-flex uk-open" uk-modal="">
        <div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">
          <button class="uk-modal-close-default uk-icon uk-close" type="button" uk-close=""><svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg"><line fill="none" stroke="#000" stroke-width="1.1" x1="1" y1="1" x2="13" y2="13"></line><line fill="none" stroke="#000" stroke-width="1.1" x1="13" y1="1" x2="1" y2="13"></line></svg></button>
          <p>${cmsfn.decode(content).alarm_text}</p>
        </div>
      </div>      
    [/#if]
  </body>
  <script>
    document.addEventListener("DOMContentLoaded", e => {
      const interval = "${(content.imagesInterval!0)}" * 1000;
      const holder = document.querySelector(".vgz-home-div-bgr");
      holder.style.transition = "background-image 1s linear";
      const imageElements = document.querySelectorAll(".vgz-home-hidden");
      const images = [];
      imageElements.forEach(el => images.push(el.dataset.vgzBgr));
      shuffle(images);
      holder.style.backgroundImage = "url('" + images[0] + "')";
      var index = 0;
      setInterval(() => {
        holder.style.backgroundImage = "url('" + images[(index++ % images.length)] + "')";
      }, interval);
    });
    
    function shuffle(array) {
      var curId = array.length;
      while (0 !== curId) {
        var randId = Math.floor(Math.random() * curId);
        curId -= 1;
        var tmp = array[curId];
        array[curId] = array[randId];
        array[randId] = tmp;
      }
    };
  </script>
</html>
