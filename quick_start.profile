<?php

/**
 * @file
 * Enables modules and site configuration for a standard site installation.
 */

use Drupal\Core\Form\FormStateInterface;

/**
 * Add any custom code here like hook implementations.
 */
function quick_start_install_tasks(&$install_state) {
  $tasks = [
    'quick_start_install_profile_modules' => [
      'display_name' => t('Install Quick Start modules'),
      'type' => 'batch',
    ],
  ];
  return $tasks;
}

/**
 * Installs required modules via a batch process.
 *
 * @param array $install_state
 *   An array of information about the current installation state.
 *
 * @return array
 *   The batch definition.
 */
function quick_start_install_profile_modules(array &$install_state) {

  $files = system_rebuild_module_data();

  $modules = [
    'varbase_core' => 'varbase_core',
    'varbase_admin' => 'varbase_admin',
    'varbase_media' => 'varbase_media',
    'varbase_security' => 'varbase_security',
    'varbase_webform' => 'varbase_webform',
    'quick_editor' => 'quick_editor',
    'varbase_bootstrap_paragraphs' => 'varbase_bootstrap_paragraphs',
    'varbase_page' => 'varbase_page',
    'varbase_landing' => 'varbase_landing',
    'varbase_search' => 'varbase_search',
    'varbase_seo' => 'varbase_seo',
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

/**
 * Implements callback_batch_operation().
 *
 * Performs batch installation of modules.
 */
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
      // Do not copy if the folder already exists.
      if (FALSE == folder_exist($res)) {
        quick_start_recurse_copy($source, $res);
      }
    };
  }
}

/**
 * Checks if a folder exist and return canonicalized absolute pathname.
 *
 * @param string $folder
 *   The path being checked.
 *
 * @return mixed
 *   returns the canonicalized absolute pathname on success otherwise
 *   FALSE is returned
 */
function folder_exist($folder) {
  // Get canonicalized absolute pathname.
  $path = realpath($folder);

  // If it exist, check if it's a directory.
  return ($path !== FALSE and is_dir($path)) ? $path : FALSE;
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

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function quick_start_form_install_configure_form_alter(&$form, FormStateInterface $form_state) {
  // Add a placeholder as example that one can choose an arbitrary site name.
  $form['site_information']['site_name']['#attributes']['placeholder'] = t('My Official Site Name');
  $form['site_information']['site_mail']['#attributes']['style'] = 'width: 25em;';

  // Default user 1 username should be 'webmaster'.
  $form['admin_account']['account']['name']['#default_value'] = 'webmaster';
}
