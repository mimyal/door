require_relative 'spec_helper'
module Dungeon

  describe Lock do

    describe "#initialize" do
      let(:lock) { Lock.new("ABC123") }

      it "can create an object of Lock" do
        lock.must_be_instance_of(Lock)
      end

      it"responds to parameter lock id" do
        lock.must_respond_to(:id)
        lock.must_respond_to(:is_locked)
      end

      it "should be unlocked on initialization" do
        lock.is_locked.must_equal(false)
      end

    end

    describe "#turn_key" do
      before(:each) do
        @unlocked_lock = Lock.new("ABC123")
        @another_lock = Lock.new("ABC123")
      end

      it "should be possible to turn the key in the lock to switch lock state" do
        @unlocked_lock.turn_key("ABC123")
        @unlocked_lock.is_locked.must_equal(true)
        @unlocked_lock.turn_key("ABC123")
        @unlocked_lock.is_locked.must_equal(false)
      end

      it "must fail to lock/unlock unless key identifier match input key" do
        proc{@another_lock.turn_key("BADKEY")}.must_raise(ArgumentError)
      end

    end #method

    describe "#locked?" do
      before(:each) do
        @unlocked_lock = Lock.new("ABC123")
        @another_lock = Lock.new("ABC123")
      end

      it "should return false if the lock is unlocked" do
        @unlocked_lock.locked?.must_equal(false)
      end

      it "should return true if the lock is locked" do
        @another_lock.turn_key("ABC123")
        @another_lock.locked?.must_equal(true)
      end
    end




  end
end