<?php

class LocalController extends Controller
{

	public function actionSpace()
	{
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'
		//$this->render('index');
		//exit();
		$this->renderPartial('space');
	}
	public function actionMario()
	{
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'
		//$this->render('index');
		//exit();
		$this->render('mario');
	}
	public function actionSnake()
	{
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'
		//$this->render('index');
		//exit();
		$this->render('snake');
	}
	public function actionArkanoid()
	{
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'
		//$this->render('index');
		//exit();
		$this->render('arkanoid');
	}

	
	
	
}