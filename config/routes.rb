Myfarm::Application.routes.draw do
  




  resources :inventorytickets

  resources :invoices

  resources :subscriptions

  resources :farmexpenses

  resources :supplyinventory_trans

  resources :equipmentactivities

  resources :supplyinventories

  resources :podetails

  resources :pos

  resources :fieldmappings

  resources :shipmentdetails

  resources :shipments

  resources :inventorylots

  resources :contracts

  resources :harvestsources

  resources :scaletickets

  resources :storages

  resources :farms

  resources :ztimes

  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}

  resources :farmjobequipments

  resources :types

  resources :weathers

  resources :farmjobsupplies

  resources :farmjobs

  resources :farmjoblabors

  resources :fieldtasksupplies

  resources :supplies

  resources :fieldtasks

  resources :equipment

  resources :fields
  
  resources :cropplans

  resources :crops

  resources :countries

  resources :partytypes

  resources :partyroles

  resources :parties
  
  resources :events

  #get "pages/home"

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  
  get "sessions/new"
  get "users/new"
  get "users/show"
  get "users/edit"
  get "users/signup"
  get "pages/contact"
  get "pages/route"
  get "pages/about"
  get "pages/home"
  get "pages/home_new"
  get "pages/tutorial"
  get "pages/help"
  get "users/show"
  get "microposts/new"
  get "microposts/delete"
 
  
  match '/', :to => 'homes#validate_status'
  match '/home', :to => 'pages#home'
  match '/home_new', :to => 'pages#home_new'
  match '/mapcanvas', :to => 'pages#mapcanvas'
  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'
  match '/tutorial', :to => 'pages#tutorial'
  match '/help', :to => 'pages#help'
  match '/signup', :to => 'users#new'
  match '/edit', :to => 'users#edit'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/delete', :to => 'microposts#destroy'
  match '/fieldtasks/fieldtask_supplies', :to => 'fieldtasks#fieldtask_supplies'
  match '/fieldtasksupplies', :to => 'fieldtasks#fieldtask_supplies'
 

  
  #routes for dthmlxgrid processing
  #Parties
  match '/partyview', :to => 'parties#index_view'
  match '/partydata', :to => 'parties#index_data'
  match '/partygridaction', :to => 'parties#index_dbaction'
  #Crops
  match '/cropview', :to => 'crops#index_view'
  match '/cropdata', :to => 'crops#index_data'
  match '/cropgridaction', :to => 'crops#dbaction'
  #Crop plans
  match '/cropplanview', :to => 'cropplans#index_view'
  match '/cropplandata', :to => 'cropplans#index_data'
  match '/cropplangridaction', :to => 'cropplans#dbaction'
  #Farms
  match '/farmview', :to => 'farms#index_view'
  match '/farmdata', :to => 'farms#index_data'
  match '/farmgridaction', :to => 'farms#index_dbaction'
  #Fields
  match '/fieldview', :to => 'fields#index_view'
  match '/fielddata', :to => 'fields#index_data'
  match '/fieldgridaction', :to => 'fields#dbaction'
  #Field mapping
  match '/fieldmapping', :to => 'fieldmappings#fieldmapping'
  #Fieldtasks
  match '/fieldtaskview', :to => 'fieldtasks#index_view'
  match '/fieldtaskdata', :to => 'fieldtasks#index_data'
  match '/fieldtaskgridaction', :to => 'fieldtasks#dbaction'
  #Fieldtasksupplies
  match '/fieldtasksupplyview', :to => 'fieldtasksupplies#index_view'
  match '/fieldtasksupplydata', :to => 'fieldtasksupplies#index_data'
  match '/fieldtasksupplygridaction', :to => 'fieldtasksupplies#index_dbaction'
  #Farm jobs
  match '/farmjobview', :to => 'farmjobs#index_view'
  match '/farmjobdata', :to => 'farmjobs#index_data'
  match '/farmjobgridaction', :to => 'farmjobs#index_dbaction'
  #Supplies
  match '/supplyview', :to => 'supplies#index_view'
  match '/supplydata', :to => 'supplies#index_data'
  match '/supplygridaction', :to => 'supplies#index_dbaction'
  #Equipment
  match '/equipmentview', :to => 'equipment#index_view'
  match '/equipmentdata', :to => 'equipment#index_data'
  match '/equipmentgridaction', :to => 'equipment#index_dbaction'
  #Scale tickets
  match '/scaleticketview', :to => 'scaletickets#index_view'
  match '/scaleticketdata', :to => 'scaletickets#index_data'
  match '/scaleticketgridaction', :to => 'scaletickets#index_dbaction'
  match '/setticket', :to => 'scaletickets#set_ticket'
  match '/set_defaults', :to => 'scaletickets#set_defaults'
  #Inventory lots
  match '/inventorylotview', :to => 'inventorylots#index_view'
  match '/inventorylotdata', :to => 'inventorylots#index_data'
  match '/inventorylotgridaction', :to => 'inventorylots#index_dbaction'
  match '/inventorylots/:id/ship_detail', :to => 'inventorylots#ship_detail'
  match '/ship_detail', :to => 'inventorylots#ship_detail'
  #Supplies inventory
  match '/supplyinventoryview', :to => 'supplyinventories#index_view'
  match '/supplyinventorydata', :to => 'supplyinventories#index_data'
  match '/supplyinventorygridaction', :to => 'supplyinventories#index_dbaction'
  #Storage units
  match '/storageview', :to => 'storages#index_view'
  match '/storagedata', :to => 'storages#index_data'
  match '/storagegridaction', :to => 'storages#index_dbaction'
  #Purchase orders
  match '/poview', :to => 'pos#index_view'
  match '/podata', :to => 'pos#index_data'
  match '/pogridaction', :to => 'pos#index_dbaction'
  #Purchase order detail
  match '/podetailview', :to => 'podetails#index_view'
  match '/podetaildata', :to => 'podetails#index_data'
  match '/podetailgridaction', :to => 'podetails#index_dbaction'
  match '/podetails/:id/receiveline', :to => 'podetails#receiveline'
  #Sales contracts
  match '/contractview', :to => 'contracts#index_view'
  match '/contractdata', :to => 'contracts#index_data'
  match '/contractgridaction', :to => 'contracts#index_dbaction'
  #Shipments
  match '/shipmentview', :to => 'shipments#index_view'
  match '/shipmentdata', :to => 'shipments#index_data'
  match '/shipmentgridaction', :to => 'shipments#index_dbaction'
  #Shipment Detailss
  match '/shipmentdetailview', :to => 'shipmentdetails#index_view'
  match '/shipmentdetaildata', :to => 'shipmentdetails#index_data'
  match '/shipmentdetailgridaction', :to => 'shipmentdetails#index_dbaction'
  match 'shipmentdetails/:id/add_detail', :to => 'shipmentdetails#add_detail'
  match '/ship_line', :to => 'shipmentdetails#add_detail'
  #Invoices
  match '/invoice_generator', :to => 'invoices#invoice_generator'
  match '/invoiceview', :to => 'invoices#index_view'
  match '/invoicedata', :to => 'invoices#index_data'
  match '/invoicegridaction', :to => 'invoices#index_dbaction'
  #Inventory search
  match '/inventoryview', :to => 'shipments#inventory_view'
  match '/inventorydata', :to => 'shipments#inventory_data'
  match '/inventorygridaction', :to => 'shipments#inventory_dbaction'
  #Polyline map page
  match '/fieldmap_utility', :to => 'fields#fieldmap_utility'
  #Event calendar
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  #user admin
  match '/admin', :to =>'users#admin'
  match '/adminedit', :to =>'users#adminedit'
  match '/calendar', :to => 'calendar#index'
  #Farmjoblabor
  match '/farmjoblaborview', :to => 'farmjobs#parties_view'
  match '/farmjoblabordata', :to => 'farmjobs#parties_data'
  match '/farmjoblaborgridaction', :to => 'farmjobs#labor_dbaction'
  #Farmjobsupply
  match '/farmjobsupplyview', :to => 'farmjobs#supplies_view'
  match '/farmjobsupplydata', :to => 'farmjobs#supplies_data'
  match '/farmjobsupplygridaction', :to => 'farmjobs#supplies_dbaction'
  #Farmjobequipment
  match '/farmjobequipmentview', :to => 'farmjobs#equipment_view'
  match '/farmjobequipmentdata', :to => 'farmjobs#equipment_data'
  match '/farmjobequipmentgridaction', :to => 'farmjobs#equipment_dbaction'
  #Data types
  match '/typeview', :to => 'types#index_view'
  match '/typedata', :to => 'types#index_data'
  match '/typegridaction', :to => 'types#index_dbaction'
  #Farm expenses
  match '/farmexpenseview', :to => 'farmexpenses#index_view'
  match '/farmexpensedata', :to => 'farmexpenses#index_data'
  match '/farmexpensegridaction', :to => 'farmexpenses#index_dbaction'
  #Equipmentjobs
  match '/equipmentjobview', :to => 'equipment#equipmentjob_view'
  match '/equipmentjobdata', :to => 'equipment#equipmentjob_data'
  match '/equipmentjobgridaction', :to => 'equipment#equipmentjob_dbaction'
  #Equipmentactivity
  match '/equipementactivityview', :to => 'equipment#equiementactivity_view'
  match '/equipmentactivitydata', :to => 'equipment#equipmentactivity_data'
  match '/equipmentactivitygridaction', :to => 'equipment#equipmentactivity_dbaction'
  
  #Reports
   match '/farmjobreportrequestor', :to => 'farmjobs#farmjob_report_requestor'
   match '/farmjobreport', :to => 'farmjobs#farmjobreport'
   match '/profitabilityreportrequestor', :to => 'farmjobs#profitability_report_requestor'
   match '/profitabilityjobreport', :to => 'farmjobs#profitabilityjobreport'
   match '/invoicerequestor', :to => 'invoices#invoice_requestor'
   match '/invoicereport', :to => 'invoices#invoicereport'
   match '/yieldrequestor', :to => 'crops#yield_requestor'
   match '/yieldreport', :to => 'crops#yieldreport'
   
  root :to => 'pages#home'
  #root_path => 'pages#home'
  #root_url => 'http://localhost:3000/'
  
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
