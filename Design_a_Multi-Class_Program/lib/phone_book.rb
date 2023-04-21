class PhoneBook
  def initialize(diary)
    @diary = diary
  end

  def contacts_from_diary
    @diary.list_entries.flat_map do |entry|
      extract_phone_numbers(entry)
    end.uniq
  end

  private

  def extract_phone_numbers(entry)
    entry.read_text.scan(/07[0-9]{9}/)
  end
end