# API
# --------
api: 2

# Core
# --------
core: 8.x

# Projects
# --------
defaults:
  projects:
    subdir: 'contrib'
    version: ~
projects:
  # Core		
  drupal:
    version: 8.4.4
  # Pull in install profile.
  quick_start:
    type: 'profile'
    subdir: ''
    download:
      type: 'git'
      url: 'https://github.com/lexsoft00/Quick-Start-Distribution-Profile-for-Drupal-8.git'  
  # Projects      
  ace_editor:
    version: '1.0'
  admin_toolbar:
    version: '1.22'
  adminimal_admin_toolbar:
    version: '1.5'
  advanced_text_formatter:
    version: 1.0-beta3
  autocomplete_deluxe:
    version: 1.0-beta1
  autogrow:
    version: '1.0'
  better_exposed_filters:
    version: 3.0-alpha3
  block_class:
    version: 1.0-alpha1
  bootstrap_layouts:
    version: '5.0'
  bootstrap_paragraphs:
    version: 2.0-beta2
    patch:
    # Adding Bootstrap Grid and Removing Background Classes
      - 'https://raw.githubusercontent.com/lexsoft00/dc_bootstrap_paragraphs.patch/master/dc_bootstrap_paragraphs.patch' 
  captcha:
    version: 1.0-beta1
  ckeditor_accordion:
    version: '1.0'
  ckeditor_bootstrap_buttons:
    version: '1.1'
  ckeditor_widgets:
    version: 1.x-dev
    patch:
    # Adding Bootstrap Grid and Removing Background Classes
      - 'https://raw.githubusercontent.com/lexsoft00/dc_ckeditor_widgets.patch/master/dc_ckeditor_widgets.patch' 
  coffee:
    version: 1.0-beta2
    patch:
    # Issue #2815381: Coffee breaks whole page when using right to left (rtl) languages in drupal 8
      - 'https://www.drupal.org/files/issues/coffee-coffee_breaks_page_with_rtl-2815381-6.patch'
    # Issue #2872093: Coffee css fixes in RTL  
      - 'https://www.drupal.org/files/issues/2872093-10.patch'
  colordialog:
    version: '1.1'
  config_update:
    version: '1.5'
  contact_formatter:
    version: '1.0'
  content_lock:
    version: 1.0-alpha4
    patch:
    # Issue #2907026: Fixed Warning: When we do not have content types yet in the system.
      - 'https://www.drupal.org/files/issues/2907026-7_0.patch'
  crop:
    version: '1.3'
  ctools:
    version: '3.0'
  devel:
    version: '1.2'
  diff:
    version: 1.0-rc1
  dropzonejs:
    version: 1.0-alpha8
  ds:
    version: '3.1'
  embed:
    version: '1.0'
  entity:
    version: 1.0-beta1
  entity_browser:
    version: '1.4'
  entity_clone:
    version: 1.0-alpha2
  entity_embed:
    version: 1.0-beta2
  entity_reference_revisions:
    version: '1.4'
  entityqueue:
    version: 1.0-alpha7
  entityqueue_form_widget:
    version: 1.0-beta3
  features:
    version: '3.5'
  field_group:
    version: 3.0-beta1
  file_browser:
    version: '1.1'
  focal_point:
    version: 1.0-beta5
    patch:
    # Issue #2915497: Missing schema for focal_point_scale_and_crop effect
      - 'https://www.drupal.org/files/issues/2915497_3.patch'
    # Issue #2916562: Broken image preview  
      - 'https://www.drupal.org/files/issues/2916562-16.patch'
  glyphicons:
    version: '1.2'
  google_analytics:
    version: '2.2'
  imageapi_optimize:
    version: 2.0-alpha3
  inline_entity_form:
    version: 1.0-beta1
  inline_responsive_images:
    version: '2.1'
  libraries_ui:
    version: '1.0'
  link_attributes:
    version: '1.2'
  linkit:
    version: '4.3'
  login_destination:
    version: 1.x-dev
  mailsystem:
    version: '4.1'
  masquerade:
    version: 2.0-beta1
  maxlength:
    version: 1.0-beta1
  media_entity:
    version: '1.7'
  media_entity_document:
    version: '1.1'
  media_entity_image:
    version: '1.2'
  menu_block:
    version: '1.4'
  menu_position:
    version: 1.x-dev
  metatag:
    version: '1.4'
  node_edit_protection:
    version: 1.x-dev
  imce:
    version: '1.6'   
  page_manager:
    version: 4.0-beta2
    patch:
    # Issue #2624972: No configuration possible in UI for 301, 303, etc. HTTP responses
      - 'https://www.drupal.org/files/issues/page_manager-redirect_location-2624972-30.patch'
  panelizer:
    version: '4.0'
  panels:
    version: '4.2'
  paragraphs:
    version: '1.2'
    patch:
    # Issue #2461695: Support translatable paragraph entity reference revision field
      - 'https://www.drupal.org/files/issues/meta_support-2461695-222.patch'
    # Issue #2868155: Add new hooks to allow easier editing of paragraph forms  
      - 'https://www.drupal.org/files/issues/2868155-16.patch'
    # Issue #2877927: Show add widget between paragraphs on hover  
      - 'https://www.drupal.org/files/issues/2877927_29.patch'
  paragraphs_previewer:
    version: '1.0'
    patch:
    # Issue #2904917: Make paragraph previewer work with new UI/UX improvement patch
      - 'https://www.drupal.org/files/issues/2904917-2.patch'
  pathauto:
    version: '1.0'
  pathologic:
    version: 1.x-dev
  rabbit_hole:
    version: 1.0-beta4
  recaptcha:
    version: '2.2'
  redirect:
    version: '1.0'      
  responsive_preview:
    version: 1.0-alpha7
  retina_images:
    version: 1.x-dev
  search_api:
    version: '1.6'
  simple_sitemap:
    version: '2.11'
  smart_trim:
    version: '1.0'
  smtp:
    version: 1.0-beta3
  token:
    version: '1.1'
  ultimate_cron:
    version: 2.0-alpha2
  userprotect:
    version: '1.0'     
  video_embed_field:
    version: '1.5'
  views_bootstrap:
    version: '3.0'
  views_infinite_scroll:
    version: '1.5'
  viewsreference:
    version: '1.2'
  webform:
    version: 5.0-rc1
  xmlsitemap:
    version: 1.0-alpha2    
  yoast_seo:
    version: '1.3'
    patch:
    # Issue #2877613 by RajabNatshah: Add [ Text (plain, long) ] filed type [string_log] for yoast seo to use.
      - 'https://www.drupal.org/files/issues/2877613-2_0.patch'
  # Themes       
  adminimal_theme_extras:
    type: 'theme'
    download:
      type: 'git'
      url: 'https://github.com/lexsoft00/adminimal_theme_extras.git'
  bootstrap:
    version: '3.7'
  drupalcoders_bootstrap:
    version: 1.0-alpha4

    
# Libraries
# --------
libraries:
  autogrow:
    download:
      type: get
      url: https://download.ckeditor.com/autogrow/releases/autogrow_4.7.3.zip
    destination: libraries
    directory_name: autogrow
  colordialog:
    download:
      type: get
      url: https://download.ckeditor.com/colordialog/releases/colordialog_4.7.3.zip
    destination: libraries
    directory_name: colordialog
  glyphicons:
    download:
      type: get
      url: https://download.ckeditor.com/glyphicons/releases/glyphicons_2.2.zip
    destination: libraries
    directory_name: glyphicons
  dropzone:
    download:
      type: get
      url: https://github.com/enyo/dropzone/archive/v4.3.0.tar.gz
    destination: libraries
    directory_name: dropzone    
  blazy:
    download:
      type: get
      url: https://github.com/dinbror/blazy/archive/1.8.2.tar.gz
    destination: libraries
    directory_name: blazy  
  slick:
    download:
      type: get
      url: https://github.com/kenwheeler/slick/archive/1.6.0.tar.gz
    destination: libraries
    directory_name: slick          
  ace:
    download:
      type: get
      url: http://github.com/ajaxorg/ace-builds/archive/v1.2.6.tar.gz
    destination: libraries
    directory_name: ace
  imagesloaded:
    download:
      type: get
      url: https://github.com/desandro/imagesloaded/archive/v3.2.0.zip
    destination: libraries
    directory_name: imagesloaded
  btbutton:
    download:
      type: get
      url: https://github.com/smonetti/btbutton/archive/master.zip
    destination: libraries
    directory_name: btbutton  
  masonry:
    download:
      type: get
      url: https://github.com/desandro/masonry/archive/v3.3.2.zip
    destination: libraries
    directory_name: masonry    