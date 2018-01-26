<?php
/**
 * @file
 * Enables modules and site configuration for a standard site installation.
 */
use Drupal\user\Entity\User;
use Drupal\Core\Form\FormStateInterface;
use Drupal\features\FeaturesManagerInterface;
use Drupal\features\ConfigurationItem;
use Drupal\search_api\Entity\Index;

// Add any custom code here like hook implementations.


function quick_start_install_tasks(&$install_state) {
  $tasks = [
    'quick_start_install_profile_modules' => [
      'display_name' => t('Install Quick Start modules'),
      'type' => 'batch',
    ],
  ];
  return $tasks;
}


function quick_start_install_profile_modules(array &$install_state) {

  $files = system_rebuild_module_data();

  $modules = [
    'quick_v_media' => 'quick_v_media',
    'token' => 'token',
    'pathauto' => 'pathauto',
    'metatag' => 'metatag',
    'metatag_facebook' => 'metatag_facebook',
    'metatag_google_plus' => 'metatag_google_plus',
    'metatag_hreflang' => 'metatag_hreflang',
    'metatag_mobile' => 'metatag_mobile',
    'metatag_open_graph' => 'metatag_open_graph',
    'metatag_verification' => 'metatag_verification',        
    'yoast_seo' => 'yoast_seo',           
    'quick_v_bootstrap_paragraphs' => 'quick_v_bootstrap_paragraphs',  
    'quick_v_landing' => 'quick_v_landing', 
    'quick_page' => 'quick_page',           
  ];
  $quick_start_modules = $modules;
  // Always install required modules first. Respect the dependencies between
  // the modules.
  $required = [];
  $non_required = [];

  // Add modules that other modules depend on.
  foreach ($modules as $module) {
    if ($files[$module]->requires) {
      $module_requires = array_keys($files[$module]->requires);
      // Remove the social modules from required modules.
      $module_requires = array_diff_key($module_requires, $quick_start_modules);
      $modules = array_merge($modules, $module_requires);
    }
  }
  $modules = array_unique($modules);
  // Remove the social modules from to install modules.
  $modules = array_diff_key($modules, $quick_start_modules);
  foreach ($modules as $module) {
    if (!empty($files[$module]->info['required'])) {
      $required[$module] = $files[$module]->sort;
    }
    else {
      $non_required[$module] = $files[$module]->sort;
    }
  }
  arsort($required);

  $operations = [];
  foreach ($required + $non_required + $quick_start_modules as $module => $weight) {
    $operations[] = [
      '_quick_start_install_module_batch',
      [[$module], $module],
    ];
  }

  $batch = [
    'operations' => $operations,
    'title' => t('Install Quick Start modules'),
    'error_message' => t('The installation has encountered an error.'),
  ];
  return $batch;
}
function _quick_start_install_module_batch($module, $module_name, &$context) {
  set_time_limit(0);
  \Drupal::service('module_installer')->install($module);
  $context['results'][] = $module;
  $context['message'] = t('Install %module_name module.', ['%module_name' => $module_name]);
}

/**
 * Implements quick_start_install_tasks_alter().
 */
function quick_start_install_tasks_alter(&$tasks, $install_state) {
  foreach ($install_state as $state) {
    if ($state === 'install_bootstrap_full') {
      $source = 'profiles/quick_start/libraries/';
      $res = 'libraries/';
      quick_start_recurse_copy($source, $res);
      drupal_get_messages();
    };
  }
}

/**
 * Recursive copy.
 *
 * @param string $src
 *   - Source folder with files.
 * @param string $dst
 *   - Destination folder.
 */
function quick_start_recurse_copy($src, $dst) {
  $dir = opendir($src);
  @mkdir($dst);
  while (FALSE !== ($file = readdir($dir))) {
    if (($file != '.') && ($file != '..')) {
      if (is_dir($src . '/' . $file)) {
        quick_start_recurse_copy($src . '/' . $file, $dst . '/' . $file);
      }
      else {
        copy($src . '/' . $file, $dst . '/' . $file);
      }
    }
  }
  closedir($dir);
}

function quick_start_form_install_configure_form_alter(&$form, FormStateInterface $form_state) {
  // Add a placeholder as example that one can choose an arbitrary site name.
  $form['site_information']['site_name']['#attributes']['placeholder'] = t('My Official Site Name');
  $form['site_information']['site_mail']['#attributes']['style'] = 'width: 25em;';

  // Default user 1 username should be 'webmaster'.
  $form['admin_account']['account']['name']['#default_value'] = 'webmaster';
}