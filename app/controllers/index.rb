post '/notes' do
  @note = Note.create(:note => params[:note], :content => params[:content])
  p @note
  
  # Look in app/views/index.erb
  redirect '/notes'
end

get '/' do
 erb :index
end

get '/notes' do
  @all_notes = Note.all
  erb :success
end

get '/notes/:id/edit' do 
  @note = Note.find_by_id(params[:id])
  erb :edit_note
end

post '/notes/:id' do
  @note = Note.find_by_id(params[:id])
  @note.note = params[:note]
  
  if @note.valid?
    @note.save
    erb :show_note
  else
    erb :edit_note
  end
end


get '/notes/:id/delete' do
  @note = Note.find_by_id(params[:id])
    erb :delete_note
end


#create a way to delete an object
#create a view to show a successful deletion
#the submit button needs to have some kind of action to delete too
delete '/delete/:id' do
 #add a helper to verify you want to destroy something
  note = Note.find_by_id(params[:id])
 
  note.destroy
  redirect '/'
end