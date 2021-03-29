<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Post;
use App\Category;
use App\User;
use Auth;

class PostsController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth', ['except' => ['show', 'category', 'myPosts', 'byUser']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = $data = array(
            'title' => 'Blog || Literature || Posts',
            'posts' => Post::orderBy('created_at', 'desc')->paginate(9)
        );
        return view('posts.index')->with($data);
    }

    public function posts_management(){
        $user = Auth::user();
        return view('users.posts')->with([
            'user' => $user,
            'posts' => Post::all(),
            'title' => 'All Posts'
        ]);
    }

    public function category(Category $category){
        $data = $data = array(
            'title' => $category->name,
            'posts' => $category->posts()
        );
        return view('posts.index')->with($data);
    }

    public function myposts()
    {
        $user = Auth::user();
        return view('users.myposts')->with([
            'user' => $user,
            'posts' => $user->posts(),
            'title' => 'My Posts']);
    }

    public function byUser($user_id)
    {
        $user = User::find($user_id);
        return view('posts.index')->with([
            'user' => $user,
            'posts' => $user->posts(),
            'title' => 'My Posts']);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $title = 'Create Post';
        $categories = Category::all();
        return view('posts.create')->with([
            'categories' => $categories,
            'title' => $title
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required',
            'body' => 'required',
            'cover_image' => 'image|nullable|max:1999'
        ]);
        // Handle File Upload
        if($request->hasFile('cover_image')){
            $filenameWithExt = $request->file('cover_image')->getClientOriginalName();
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            $extension = $request->file('cover_image')->getClientOriginalExtension();
            $fileNameToStore = $filename.'_'.time().'.'.$extension;
            $path = $request->file('cover_image')->storeAs('public/images', $fileNameToStore);
        } else {
            $fileNameToStore = 'noimage.jpg';
        }
        
        //Create Post
        $post = new Post;
        $post->title = $request->input('title');
        $post->body = $request->input('body');
        $post->user_id = auth()->user()->id;
        $post->cover_image = $fileNameToStore;
        
        $post->save();
        $post->categories()->sync($request->categories);
        return redirect('/posts')->with('success', 'Post created');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $post = Post::find($id);
        $title = $post->title;
        return view('posts.show')->with([
            'post' => $post,
            'title' => $title
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $post = Post::find($id);
        if((auth()->user()->id !== $post->user_id) && (!auth()->user()->hasRole('admin'))){
            return redirect('/posts')->with('error', 'Unautorized Action');
        }
        $categories = Category::all();
        $title = 'Edit Post: '.$post->title;
        return view('posts.edit')->with([
            'categories' => $categories,
            'post' => $post,
            'title' => $title
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'title' => 'required',
            'body' => 'required',
            'cover_image' => 'image|nullable|max:1999'
        ]);
        // Handle File Upload
        if($request->hasFile('cover_image')){
            $filenameWithExt = $request->file('cover_image')->getClientOriginalName();
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            $extension = $request->file('cover_image')->getClientOriginalExtension();
            $fileNameToStore = $filename.'_'.time().'.'.$extension;
            $path = $request->file('cover_image')->storeAs('public/images', $fileNameToStore);
        }
        
        //Create Post
        $post = Post::find($id);
        $post->categories()->sync($request->categories);
        $post->title = $request->input('title');
        $post->body = $request->input('body');
        if($request->hasFile('cover_image')){
            Storage::delete('public/images/'.$post->cover_image);
            $post->cover_image = $fileNameToStore;
        }
        $post->save();

        return redirect('/posts/'.$post->id)->with(['success' => 'Post updated']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $post = Post::find($id);

        if($post->cover_image != 'noimage.jpg'){
            Storage::delete('public/images'.$post->cover_image);
        }

        $post->comments()->delete();

        $post->delete();
        return redirect('/posts')->with('success', 'Post removed');

    }

    public function indexActivities(){

    }
}
