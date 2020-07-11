class StudentsController < ApplicationController 

    def create 
    @new_student = Student.new(post_params(:first_name, :last_name))
    @new_student.save 
    redirect_to student_path(@new_student)
    end

    def show 
    @student = Student.find(params[:id])
    end

    def new 
    @student = Student.new
    end 

    def edit 
    @student = Student.find(params[:id])
    end 

    def update 
    @student = Student.find(params[:id])
    @student.update(post_params(:first_name,:last_name))
    redirect_to student_path(@student)
    end

    private 

    def post_params(*args)
    params.require(:student).permit(*args)
    end

end