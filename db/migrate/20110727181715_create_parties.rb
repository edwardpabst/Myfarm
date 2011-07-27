class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.integer :userid
      t.string :partyname
      t.string :partylastname
      t.string :partyfirstname
      t.string :partyaddress1
      t.string :partyaddress2
      t.string :partycity
      t.string :partystate
      t.string :partypostalcode
      t.string :partycountry
      t.string :partyphone
      t.string :partyemail
      t.string :partyjobtitle

      t.timestamps
    end
  end

  def self.down
    drop_table :parties
  end
end
