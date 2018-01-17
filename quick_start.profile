<?php
/**
 * @file
 * Enables modules and site configuration for a standard site installation.
 */
use Drupal\Core\Form\FormStateInterface;
// Add any custom code here like hook implementations.

function quick_start_form_install_configure_form_alter(&$form, FormStateInterface $form_state) {
  // Add a placeholder as example that one can choose an arbitrary site name.
  $form['site_information']['site_name']['#attributes']['placeholder'] = t('My Official Site Name');
  $form['site_information']['site_mail']['#attributes']['style'] = 'width: 25em;';

  // Default user 1 username should be 'webmaster'.
  $form['admin_account']['account']['name']['#default_value'] = 'webmaster';
}