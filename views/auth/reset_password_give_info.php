    
    <div class="fp-box">
        <div class="logo">
             <a href="javascript:void(0);"><b>SMS</b>- Reset Pass</a>
            <small>Student Management System, Developed by Mahadi Hasan</small>
        </div>
        <div class="card">
            <div class="body">
                <form id="forgot_password" method="POST" action="?controller=auth&action=getLink">
                    <div class="msg">
                        Enter your email address that was used to register. We'll send you an email with your username and a
                        link to reset your password.
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">email</i>
                        </span>
                        <div class="form-line">
                            <input type="email" class="form-control" name="email" placeholder="Email" required autofocus>
                        </div>
                    </div>

                    <button class="btn btn-block btn-lg bg-pink waves-effect" type="submit">SEND PASSWORD RESET LINK</button>

                    <div class="row m-t-20 m-b--5 align-center">
                        <a href="?controller=auth&action=frontpage">Sign In!</a>
                    </div>
                </form>
            </div>
        </div>
    </div>