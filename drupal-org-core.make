# API
# --------
api: 2

# Core
# --------
core: 8.x

# Projects
# --------
projects:
  # Core		
  drupal:
    version: 8.4.4
  # Pull in install profile.
  quick_start:
    type: "profile"
    subdir: ""
    download:
      type: "git"
      url: "https://github.com/lexsoft00/Quick-Start-Distribution-Profile-for-Drupal-8.git"      