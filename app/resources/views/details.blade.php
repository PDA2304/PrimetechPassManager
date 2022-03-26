<!DOCTYPE html>
<html lang="ru">
<head>
<link href="css/app.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title> Авторизация </title>
</head>
<body>
    <div class="container">
        <div class="auth">
            <form action="{{route('addData')}}" method="POST">
            @csrf
            <p>Добавить данные </p>
            @if($errors->any())
            <div>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif
            <input class="place" type="text" placeholder="Название" name="name">
            <input class="place" type="text" id="password-input" placeholder="Логин пользователя" name="login">
            <input class="place" type="password" id="password-input" placeholder="Пароль" name="password">
            <input class="place" type="textbox" id="password-input" placeholder="Описание" name="description">
            <button type="submit"> Войти </button>
        </form>
        </div>
    </div>
</body>
</html>
