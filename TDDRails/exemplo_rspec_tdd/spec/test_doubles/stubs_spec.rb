require 'student'
require 'course'

describe "Strub" do
  it "#has_finished?" do
    # setup
    student = Student.new
    course = Course.new

    allow(student).to receive(:has_finished?)
    .with(an_instance_of(Course)).and_return(true)

    #exercise
    course_finished = student.has_finished?(course)

    #verify
    expect(course_finished).to  be_truthy
  end


  it "Arg dinamicos" do
    student = Student.new

    allow(student).to receive(:foo) do |arg|
      if arg == :hello
        "ola"
      elsif arg == :hi
        "Hi!!"
      end

      expect(student.foo(:hello)).to eq("ola")
      expect(student.foo(:hi)).to eq("Hi!!")
    end
  end

  it "Qualquer instância da classe" do
    student = Student.new
    other_student = Student.new

    #quando é qualquer instancia tem q passar a classe dps do allow
    allow_any_instance_of(Student).to receive(:bar).and_return(true)
    expect(student.bar).to be_truthy
    expect(other_student.bar).to be_truthy
  end

  it "Erros" do
    student = Student.new

    allow(student).to receive(:bar).and_raise(RuntimeError)
    expect{student.bar}.to raise_error(RuntimeError)
  end

end
