class CourseFilterOnRequestAssessmentPage < SitePrism::Page
  elements :scheme_list, ".license-scheme-name"
  element :scheme_filter, "#scheme-filter-container > div> input"
  element :trainer_filter, "#txt-trainer-name"
  element :trainer_id_list, ".trainer-licenseCode"


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
    trainer_filter.send_keys(:enter)
  end

  def verify_result_on_trainer_id_filter(trainer_id)
    trainer_id_list.each do |element|
      actual_trainer_id = element.text
      expect(trainer_id).to eql(actual_trainer_id)
    end

  end

end