# Rails 控制器与路由

在 Rails 中，控制器其实就是一个类，继承自ApplicationController

＊ params[:***]

获取请求方法：request.method　＆　request.get?

嵌套的哈希
```
<form accept-charset="UTF-8" action="/clients" method="post">
  <input type="text" name="client[name]" value="Acme" />
  <input type="text" name="client[phone]" value="12345" />
  <input type="text" name="client[address][postcode]" value="12345" />
  <input type="text" name="client[address][city]" value="Carrot City" />
</form>
=>
{
  "name" => "Acme",
  "phone" => "12345",
  "address" => {
    "postcode" => "12345",
    "city" => "Carrot City"
  }
}
```
```
get '/clients/:status' => 'clients#index', foo: 'bar'
当用户访问/clients/active的时候，params[:status]的值就是"active"。同时params[:foo的值也被设置为"bar"。
```
----

```
get 'profile', to: 'users#show'
将对/profile页面的访问映射到users控制器的show方法上。
```
带命名空间的控制器的路由
```
$ rails generate controller Admin::controllern_name action
namespace :admin do
  resources :posts, :comments
end
会将/admin/posts映射到Admin:PostsController控制器上
```
```
想将没有/admin前缀的路径也映射到Admin:PostsController可以这么做
scope module: 'admin' do
  resources :posts
end
这样访问/admin/posts时就会映射到控制器PostsController上了
```
```
不想要使用命名空间，也想把/admin/posts映射到普通控制器上，那么可以这么做
scope '/admin' do
  resources :posts
end
这样访问/admin/posts时就会映射到控制器PostsController上了
```


```
嵌套资源
resources :magazines do
  resources :ads
end
resources :posts do
  resources :comments, only: [:index, :new, :create]
end
resources :comments, only: [:show, :edit, :update, :destroy]
```






















