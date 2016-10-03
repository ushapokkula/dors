class CourseFilterOnRequestAssessmentPage < SitePrism::Page
  elements :scheme_list, ".license-scheme-name"
  element :scheme_filter, "#scheme-filter-container > div> input"
  element :trainer_filter, "#txt-trainer-name"
  elements :trainer_id_list, ".trainer-licenseCode"
  element :force_filter, "#force-areas-filter-container > div> input"
  element :force_filter_container, "#force-areas-filter-container"
  elements :trainer_fullname, ".trainer-full-name"


  def verify_trainers_list_single_course(course_name)
    scheme_list.each do |element|
      actual_scheme = element.text
      puts expect(actual_scheme).to eql(course_name)
    end
  end

  def verify_filter_for_one_course(course_name)
    scheme_filter.set(course_name)
    expect(page).to have_css(".ui-select-choices", visible: true)
    scheme_filter.send_keys(:enter)
    trainer_filter.click #to collpase the filter
  end

  def verify_filter_for_multiple_course(course1, course2, course3)
    scheme_filter.set(course1)
    scheme_filter.send_keys(:enter)
    scheme_filter.set(course2)
    scheme_filter.send_keys(:enter)
    scheme_filter.set(course3)
    scheme_filter.send_keys(:enter)
    trainer_filter.click
  end

  def verify_trainer_list_multiple_courses(course1, course2, course3)
    actual_scheme_list =[course1, course2, course3]
    expected_scheme_list = []
    scheme_list.each do |element|
      actual_scheme = element.text
      expected_scheme_list.push(actual_scheme)
    end
    expect(actual_scheme_list).to match_array(expected_scheme_list.uniq)
  end

  def filter_by_trainer_id(trainer_id)
    trainer_filter.set(trainer_id)
    expect(page).to have_css("#txt-trainer-name + .dropdown-menu li", visible: true)
    find("#txt-trainer-name + .dropdown-menu li").click
  end

  def verify_result_on_trainer_id_filter(trainer_id)
    trainer_id_list.each do |element|
      actual_trainer_id = element.text
      expect(trainer_id).to eql(actual_trainer_id)
    end
  end

  def verify_list_on_course_and_trainer_filter(course1, course2)
    actual_scheme_list =[course1, course2]
    expected_scheme_list = []
    scheme_list.each do |element|
      actual_scheme = element.text
      expected_scheme_list.push(actual_scheme)
    end
    expect(actual_scheme_list).to match_array(expected_scheme_list.uniq)

  end

  def apply_force_filter(force1, force2)
    force_filter.set(force1)
    force_filter.send_keys(:enter)
    force_filter.set(force2)
    force_filter.send_keys(:enter)
    trainer_filter.click
  end

  def verify_list_based_on_forcefilter(force1, force2)
    expect(force_filter_container.text).to include(force1, force2)
    expect(page).to have_css(".dors-table", visible: true, count: 6)
    actual_trainer_list =[]
    trainer_fullname.each do |element|
      trainer_names= element.text
      actual_trainer_list.push(trainer_names)
    end
    expect(actual_trainer_list).to include("auto2 trainer", "auto1 trainer")
  end

  def verify_combination_filter(force1, force2,course_name,trainer_id)
  puts expect(force_filter_container.text).to include(force1, force2)
 puts  expect(page).to have_css(".dors-table", visible: true, count: 1)
  verify_trainers_list_single_course(course_name)
  verify_result_on_trainer_id_filter(trainer_id)
  end
end