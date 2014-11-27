class AddJumpycatScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :jumpycat_score, :integer
  end
end
