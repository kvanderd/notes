
helpers do
  def beauty_display(all_notes)
    @all_notes.each do |note|
      p note.note
      p note.content
    end
  end
end
