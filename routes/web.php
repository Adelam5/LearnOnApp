<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'PagesController@index');
Route::get('/about', 'PagesController@about');

Route::get('courses/addLesson', 'PagesController@addLesson');
Route::get('courses/addTest', 'LessonsController@store');
Route::get('courses/addQuest', 'TestsController@store');

Auth::routes();

Route::get('/profile/myposts', 'PostsController@myposts');
Route::resource('profile', 'ProfilesController');

Route::namespace('Admin')->prefix('admin')->name('admin.')->middleware('can:manage-users')->group(function(){
    Route::resource('/users', 'UsersController', ['except' => ['show', 'create', 'store']]);
});
Route::get('admin/subscriptions_management', 'BillingController@subscriptions_management')->middleware('can:manage-users');
Route::get('courses_management', 'CoursesController@courses_management')->middleware('can:manage-posts');
Route::get('posts_management', 'PostsController@posts_management')->middleware('can:manage-posts');
Route::get('tests_management', 'TestsController@tests_management')->middleware('can:manage-posts');

Route::resource('posts', 'PostsController');
Route::resource('comments', 'CommentsController');
Route::resource('courses', 'CoursesController');
Route::resource('lessons', 'LessonsController');
Route::resource('tests', 'TestsController');
Route::resource('questions', 'QuestionsController');
Route::resource('answers', 'AnswersController');

Route::get('posts/category/{category}', 'PostsController@category')->name('category');
Route::get('posts/byUser/{byUser}', 'PostsController@byUser')->name('byUser');

Route::get('courses/{id}/enroll', 'CoursesController@enroll');
Route::get('active', 'CoursesController@active')->middleware('can:access-active');
Route::get('/archive', 'CoursesController@archive');
Route::get('courses/{id}/{lesson_id}', 'CoursesController@start');
Route::get('mycourses', 'CoursesController@mycourses');
Route::get('test/{id}', 'CoursesController@test');
Route::post('test', 'CoursesController@storeTestResult');

Route::get('/contact', [
    'uses' => 'ContactMessageController@create'
]);

Route::post('/contact', [
    'uses' => 'ContactMessageController@store',
    'as' => 'contact.store'
]);

/* Route::get('/subscribe', 'SubscriptionController@showSubscription');
      Route::post('/subscribe', 'SubscriptionController@processSubscription');      // welcome page only for subscribed users
      Route::get('/welcome', 'SubscriptionController@showWelcome')->middleware('subscribed'); */

Route::post('billing', 'BillingController@index')->name('billing');
Route::post('cancelSubscription', 'BillingController@cancelSubscription')->name('cancelSubscription');
Route::get('reprocess', 'BillingController@reprocess')->name('reprocess');
Route::get('/join', 'BillingController@showJoin')->name('join');

Route::get('subme', function(){
    //dd(auth()->user()->defaultPaymentMethod()->id);
    auth()->user()->newSubscription('main', 'price_1IIskfED8dpSHnI3yXuwxvgh')->create(auth()->user()->defaultPaymentMethod()->id);
})->name('subme');