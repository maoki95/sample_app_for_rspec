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
      without_task_title = build(:task, title: "")
      expect(without_task_title).to be_invalid
      expect(without_task_title.errors[:title]).to eq ["can't be blank"]
    end
    it 'is invalid without status' do
      without_task_status = build(:task,status: nil)
      expect(without_task_status).to be_invalid
      expect(without_task_status.errors[:status]).to eq ["can't be blank"]
    end
    it 'is invalid with a duplicate title' do 
    task = create(:task)
    duplicate_task_title = build(:task, title: task.title)
    expect(duplicate_task_title).to be_invalid
    expect(duplicate_task_title.errors[:title]).to eq ["has already been taken"]
    end
    it 'is valid with another title' do 
    task = create(:task)
    another_task_title = build(:task,title: "another_title")
    expect(another_task_title).to be_valid
    expect(another_task_title.errors).to be_empty
    end
  end
end
