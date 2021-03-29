@extends('layouts.app-users')
@section('main')

    <div class="row">
        <div class="col-md-12">
            <form action=" {{ route('profile.update', $user) }}" method="POST" enctype="multipart/form-data">
                @csrf
                {{ method_field('PUT') }}
                <div class="form-group row">
                    <label style="width: 200px" for="name" class="col-md-2 col-form-label text-md-right">{{ __('Name') }}</label>
        
                    <div class="col-md-6">
                        <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ $user->name }}" required autocomplete="name" autofocus>
        
                        @error('name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                </div>
        
                <div class="form-group row">
                    <label for="email" class="col-md-2 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>
        
                    <div class="col-md-6">
                        <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ $user->email }}" required autocomplete="email">
        
                        @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                </div>
                <div class="form-group row">
                    <label for="avatar" class="col-md-2 col-form-label text-md-right">Chose avatar:</label>
                    <div class="col-md-8">
                        <input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg, image/jpg"><br>
                        <small>Avatar image must be 1:1 ratio and not wither then 200px</small>
                    </div>
                </div>
                <div class="form-group row">
                    <label style="width: 200px" for="submit" class="col-md-2 col-form-label text-md-right mr-3"></label>
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>

                
            </form>
        </div>
    </div>


@endsection