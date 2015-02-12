<?php

class JocController extends Controller
{
	public function filters()
	{
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'
		//$this->render('index');
		
		return array(array('CrugeAccessControlFilter'));
		
	}

	public function actionIndex()
	{
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'
		//$this->render('index');
		//exit();
		$this->render('index');
	}

	public function actionReload()
	{
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'
		//$this->render('index');
		$this->layout = false;
		//exit();
		$this->render('reload');
	}
	public function actionActualitza()
	{
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'
		//$this->render('index');
		$this->layout = false;
		//exit();
		$this->render('actualitza');
	}

	
	
}