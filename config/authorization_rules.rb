 authorization do
   role :admin do
     has_permission_on [:projects, :activities], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
   end
 end

