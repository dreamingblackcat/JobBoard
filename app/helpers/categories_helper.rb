module CategoriesHelper
  def form_options
    if self.=="new" then {:url=>categories_path(:user_id=>current_user.id),:method=>:post}
    else
      {:url=>category_path(:id=>@category.id,:user_id=>current_user.id),:method=>:post}
    end
  end
end
