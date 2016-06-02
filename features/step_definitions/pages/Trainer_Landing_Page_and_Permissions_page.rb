class TrainerLandingPageAndPermissionsPage < SitePrism::Page
  element  :page_title, "#auto-page-title"
  element  :myprofile_link, "#nav-bar-menu > li:nth-child(2) > a"
  element  :trainer_name, ".auto-trainer-full-name"
  element  :trainer_id, ".auto-trainer-id"
  element   :course_name, ".auto-scheme-name"
  element   :license_status, ".auto-license-status"
  element   :expiry_date, ".auto-license-expirydate"





end