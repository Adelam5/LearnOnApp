<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\User;
use App\Role;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::truncate();
        DB::table('role_user')->truncate();

        $adminRole = Role::where('name', 'admin')->first();
        $authorRole = Role::where('name', 'author')->first();
        $memberRole = Role::where('name', 'member')->first();
        $userRole = Role::where('name', 'user')->first();

        $admin = User::create([
            'name' => 'Admin User',
            'email' => 'admin@admin.com',
            'password' => Hash::make('12345678')    
        ]);

        $author = User::create([
            'name' => 'Author User',
            'email' => 'author@author.com',
            'password' => Hash::make('12345678')    
        ]);

        $member = User::create([
            'name' => 'Member User',
            'email' => 'member@member.com',
            'password' => Hash::make('12345678')    
        ]);

        $user = User::create([
            'name' => 'User User',
            'email' => 'user@user.com',
            'password' => Hash::make('12345678')    
        ]);

        $admin->roles()->attach($adminRole);
        $author->roles()->attach($authorRole);
        $member->roles()->attach($memberRole);
        $user->roles()->attach($userRole);
    }
}
