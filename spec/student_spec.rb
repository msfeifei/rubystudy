require 'spec_helper'

describe Student do
    before :each do
        @student = Student.new("feifei", "wang", "gender", "email")
    end
    it "should response to 'full_name'" do
        expect(@student.full_name).to eql("feifei wang")
    end
end
