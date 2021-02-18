require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'validation' do
    it 'is valid with all attributes' do
      task = build(:task)
      expect(task).to be_valid
      expect(task.errors).to be_empty
    end
    it 'is invalid without title' do 
      without_task_title = build(:task,title: nil)
      without_task_title.valid?
      expect(without_task_title.errors[:title]).to include("can't be blank")
    end
    it 'is invalid without status' do
      without_task_status = build(:task,status: "")
      without_task_status.valid?
      expect(without_task_status.errors[:status]).to include("can't be blank")
    end
    it 'is invalid with a duplicate title' do 
    task = create(:task)
    task2 = build(:task,title: task.title)
    task2.valid?
    expect(task2.errors[:title]).to include("has already been taken")
    end
    it 'is valid with another title' do 
    task = create(:task)
    task2 = build(:task,title: "another_title")
    task2.valid?
    expect(task2.errors).to be_empty
    end
  end
end
