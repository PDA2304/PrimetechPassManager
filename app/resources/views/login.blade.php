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
    <script>
        $('body').on('click', '.password-checkbox', function () {
    if ($(this).is(':checked')) {
        $('#password-input').attr('type', 'text');
    } else {
        $('#password-input').attr('type', 'password');
    }
});
    </script>
    <div class="container">
        <div class="auth">
            <form action="{{route('loginSubmit')}}" method="POST">
            @csrf
            <p>Авторизация </p>
            @if($errors->any())
            <div>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif
            <input class="place" type="text" placeholder="Логин" name="login">
            <input class="place" type="password" id="password-input" placeholder="Пароль" name="password">
            <div class="checked">
                <label> <input type="checkbox" class="password-checkbox"> Показать пароль</label> <a href="{{ url('reg')}}">Забыли пароль?</a>
            </div>

            <button type="submit"> Войти </button>
            <h3>Вы не зарегистрированы? <a href="{{ url('reg')}}">Регистрация</a></h3>
        </form>
        </div>
    </div>
</body>
</html>
