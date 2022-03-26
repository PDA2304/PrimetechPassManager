<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="../../css/app.css" type="text/css" rel="stylesheet">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title> Авторизация </title>
</head>
<body>
    <div class="container">
        <div class="auth">
            <form action="{{route('updateUserData', $user->id)}}" method="POST">
            @csrf
            <p> Обновить данные </p>
            @if($errors->any())
            <div>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif
            <input class="place" type="text" value="{{$user->name}}" name="name" >
            <input class="place" type="text" value="{{$user->login}}" name="login">
            <input class="place" type="password" value="{{$user->password}}" name="password">
            <input class="place" type="textbox" value="{{$user->discription}}" name="description">
            <a href=''><button type="submit"> Изменить </button> </a>
        </form>
        </div>
    </div>
</body>
</html>
