<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]

    [#include "../include/functions.ftl"]
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
  <body class="vgz-page-textbild ${cmsfn.language()}">
      <div class="tm-page">
        [#assign root = cmsfn.root(content, "mgnl:page") ]
        [#include "../include/navigation.ftl"]

        <!-- Navigation over Image left -->
        <div class="btnRow btnRowLeft uk-visible@m">
          <div class="uk-flex-middle uk-grid-small uk-child-width-auto uk-grid" uk-grid="">
            <div class="el-item"> <a class="el-content uk-button uk-button-default" href="#">Sauna Abonnement </a> </div>
            <div class="el-item"> <a class="el-content uk-button uk-button-default" href="#">Massage buchen </a> </div>
            <div class="el-item"> <a class="el-content uk-button uk-button-default" href="agenda.php">Agenda </a> </div>
            <div class="el-item"> <a class="el-content uk-button uk-button-default" href="#">Mitgliedschaften </a> </div>
          </div>
        </div>        
          
        <!-- Content - 2 Cols -->
        <div id="content" class="uk-section-muted uk-section uk-padding-remove-vertical">
          <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
            <div class="uk-width-1-2@m">

              <!-- Content - Col Left -->
              <div class="uk-section-muted">
                <div style="background-image: url(images/sauna.jpg); height: calc(-60px + 100vh);" class="uk-background-norepeat uk-background-cover uk-background-center-center uk-flex" uk-height-viewport="offset-top: true;">
                  <div class="uk-width-1-1">
                    <div class="tm-grid-expand uk-child-width-1-1 uk-grid-margin uk-grid uk-grid-stack" uk-grid="">
                      <div class="uk-first-column">
                        
                        <!-- Slideshow -->
                        <div uk-slideshow="ratio: false; animation: fade; autoplay: 1; pauseOnHover: false;" class="uk-margin uk-text-left@l uk-slideshow">
                          <div class="uk-position-relative">
                            <ul class="uk-slideshow-items" uk-height-viewport="offset-top: true; minHeight: 600;">
                              [#list content.images as slideImg ]
                                <li class="el-item uk-transition"><img class="el-image uk-cover" alt="" uk-img="target: !.uk-slideshow-items" src="${damfn.getAssetLink(slideImg)}"></li>
                              [/#list]
                            </ul>
                          </div>
                        </div>

                        <!-- Navigation under Logo right // Placed here for Mobile View -->
                        <div id="subNav" class="btnRow btnRowRight">
                          <div class="uk-flex-middle uk-grid-small uk-child-width-auto uk-grid" uk-grid="">
                            <div class="el-item"> <a class="el-content uk-button uk-button-default" href="#">Abonnement kaufen</a> </div>
                            <div class="el-item"> <a class="el-content uk-button uk-button-default" href="#">Jetzt Mitglied werden</a> </div>                      
                          </div>
                        </div>                        

                      </div>
                    </div>
                  </div>
                </div>
              </div>

            </div>
            <div class="uk-grid-item-match uk-width-1-2@m">

              <!-- Content - Col Right -->
              <div class="uk-section-muted uk-section uk-section-small innerSection">
                <div class="uk-container">
                  <div class="tm-grid-expand uk-grid-margin uk-grid" uk-grid="">
                    <div class="uk-width-2-3@m"> 
                      <h1>${content.title!}</h1>
                      [@cms.area name="content"/]                                      
                    </div>
                    <div class="uk-width-1-3@m"></div>
                  </div>
                </div>
              </div>       
              
            </div>
          </div>
        </div>    

        [#include "../include/footer.ftl"]      
      </div>
  </body>
</html>
