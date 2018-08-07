core: 8.x
api: 2

defaults:
  projects:
    subdir: 'contrib'

projects:
  drupal:
    version: '8.5.6'	
  ace_editor:
    version: '1.0'  
    patch:
        # ;; Issue #2916832: Add support for calling libraries from the current active profile  
     - "https://www.drupal.org/files/issues/2916832-4.patch"    
  admin_toolbar:
    version: '1.24'
  adminimal_admin_toolbar:
    version: '1.7'
  advanced_text_formatter:
    version: 1.0-beta3
  autocomplete_deluxe:
    version: 1.0-beta1
  better_exposed_filters:
    version: 3.0-alpha4
  blazy:
    version: 1.0-rc2
  block_class:
    version: '1.0'
  bootstrap_layouts:
    version: '5.1'
  captcha:
    version: 1.0-beta1
  colorbox:
    version: 1.4
  colorbox_inline:
    version: 1.1    
  ckeditor_accordion:
    version: '1.1'
  ckeditor_bootstrap_grid:
    version: '1.1'        
  coffee:
    version: 1.0-beta2
    patch:
        # ;; Issue #2815381: Coffee breaks whole page when using right to left (rtl) languages in drupal 8 
     - "https://www.drupal.org/files/issues/coffee-coffee_breaks_page_with_rtl-2815381-6.patch"    
        # ;; Issue #2872093: Coffee css fixes in RTL 
     - "https://www.drupal.org/files/issues/2872093-10.patch"      
  config_update:
    version: '1.5'
  config_filter:
    version: '1.2'
  config_ignore:
    version: '2.1'
  contact_formatter:
    version: '1.0'            
  content_lock:
    version: 1.0-alpha8
  contribute:
    version: 1.0-beta7
  crop:
    version: '1.5'
  ctools:
    version: '3.0'
    patch:
        # ;; Issue #2820783: Fix Block.php notices and warnings.
     - "https://www.drupal.org/files/issues/fixblockpager-2820783-27.patch"      
  devel:
    version: '1.2'
  diff:
    version: 1.0-rc2
  dropzonejs:
    version: 1.0-alpha8
  ds:
    version: '3.1'
  embed:
    version: '1.0'
  entity:
    version: 1.0-beta4
  entity_browser:
    version: '1.5'
  entity_browser_enhanced:
    version: 1.0-rc3
  entity_clone:
    version: 1.0-alpha2
  entity_embed:
    version: 1.0-beta2
  entity_reference_revisions:
    version: '1.5'
  entityqueue:
    version: 1.0-alpha7
    patch:
        # ;; Issue #2145441: Option to create Entityqueue tab on Entity pages
     - "https://www.drupal.org/files/issues/2145441-32.patch"
        # ;; Issue #2825773: Make Contextual links work for views using Entityqueue
     - "https://www.drupal.org/files/issues/2825773-23-outside_in_to_settings_tray.patch"  
        # ;; Issue #2916026: Only users with [Administer entityqueue] should be able to delete entityqueues
     - "https://www.drupal.org/files/issues/only-users-with-administer-entityqueue-should-be-able-to-delete-entityqueues-2916026-3.patch"  
        # ;; Issue #2917308: Only users with [Administer entityqueue] should be able to edit (configure) entityqueues
     - "https://www.drupal.org/files/issues/only-users-with-administer-entityqueue-should-be-able-edit-configure-entityqueues-2917308-2.patch"                 
  entityqueue_form_widget:
    version: 1.0-beta3
  extlink:
    version: '1.1'
  features:
    version: '3.7'
  field_group:
    version: 3.0-beta1
  focal_point:
    version: 1.0-beta6
    patch:
        # ;; Issue #2916562: Broken image preview
     - "https://www.drupal.org/files/issues/2916562-16.patch"    
  google_analytics:
    version: '2.3'
  imageapi_optimize:
    version: 2.0-alpha3
  inline_entity_form:
    version: 1.0-rc1
  inline_responsive_images:
    version: '2.1'
  libraries_ui:
    version: '1.0'
  link_attributes:
    version: '1.3'
  linkit:
    version: '4.3'
  mailsystem:
    version: '4.1'
  masquerade:
    version: 2.0-beta2
  maxlength:
    version: 1.0-beta2
  media_entity:
    version: '1.8'
  media_entity_document:
    version: '1.1'
  media_entity_image:
    version: '1.3'
  menu_block:
    version: '1.5'
  metatag:
    version: '1.5'
  node_edit_protection:
    type: "module"
    download:
      url: "https://git.drupal.org/project/node_edit_protection.git"
      revision: "902339c08222f838030c07aaea23bdc51ababebd" 
      branch: "8.x-1.x"   
  page_manager:
    version: 4.0-beta3
  panelizer:
    version: '4.1'
  panels:
    version: '4.3'
  paragraphs:
    version: '1.3'
    patch:
        # ;; Issue #2461695: Support translatable paragraph entity reference revision field
     - "https://www.drupal.org/files/issues/meta_support-2461695-222.patch" 
        # ;; Issue #2877927: Show add widget between paragraphs on hover
     - "https://www.drupal.org/files/issues/2877927_29.patch"          
  paragraphs_previewer:
    version: '1.2'
    patch:
        # ;; Issue #2904917: Make paragraph previewer work with new UI/UX improvement patch
     - "https://www.drupal.org/files/issues/2904917-2.patch"     
  pathauto:
    version: '1.2'
  pathologic:
    version: 1.0-alpha1
  quick_v_bootstrap_paragraphs:
    version: 1.0-alpha3
  quick_v_media:
    version: 1.0-alpha1
  rabbit_hole:
    version: 1.0-beta4
  recaptcha:
    version: '2.3'
  redirect:
    version: '1.2'
  schema_metatag:
    version: '1.3'
  search_api:
    version: '1.8'     
  simple_sitemap:
    version: '2.12'
  slick:
    version: '1.0'
  slick_media:
    version: '1.0'
  slick_views:
    version: 1.0-rc2     
  smart_trim:
    version: '1.1'
  smtp:
    version: 1.0-beta4
  token:
    version: '1.3'
  ultimate_cron:
    version: 2.0-alpha4
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
    version: 5.0-rc17
  yoast_seo:
    version: '1.3'
    patch:
        # ;; Issue #2877613: Add [ Text (plain, long) ] filed type [string_log] for yoast seo to use.
     - "https://www.drupal.org/files/issues/2877613-2_0.patch"     
  bootstrap:
    version: '3.12'
  drupalcoders_bootstrap:
    version: 1.0-beta04

libraries:
  dropzone:
    directory_name: dropzone 
    download:
      type: get
      url: https://github.com/enyo/dropzone/archive/v4.3.0.tar.gz
    type: library	
  blazy:
    directory_name: blazy 
    download:
      type: get
      url: https://github.com/dinbror/blazy/archive/1.8.2.tar.gz
    type: library
  slick:
    directory_name: slick
    download:
      type: get
      url: https://github.com/kenwheeler/slick/archive/1.6.0.tar.gz
    type: library
  ace:
    directory_name: ace 
    download:
      type: get
      url: http://github.com/ajaxorg/ace-builds/archive/v1.2.6.tar.gz
    type: library   
  colorbox:
    directory_name: colorbox 
    download:
      type: get
      url: https://github.com/jackmoore/colorbox/archive/1.x.tar.gz
    type: library              