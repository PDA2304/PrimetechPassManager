<a data-toggle="modal" href="modal-id"> Trigger Modal </a>
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
            <input class="place" type="text" value="{{$user->description}}" name="description">
            <a href=''><button type="submit"> Изменить </button> </a>
        </form>
        </div>
    </div>
</body>
</html>
