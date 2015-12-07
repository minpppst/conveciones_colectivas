<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>

<div class="container" id="page">

	<div id="header">
		<div id="logo"><?php echo CHtml::encode(Yii::app()->name); ?></div>
	</div><!-- header -->

	<div id="mainmenu">
		<?php $this->widget('zii.widgets.CMenu',array(
			'items'=>array(
				array('label'=>'Inicio',
                                    'url'=>array('/site/index'),
                                    'visible'=>!Yii::app()->user->isGuest),
                            
                                array ('label'=>'Convencion',
                                    'url'=>array('/Convencion/index'),
                                    'visible'=>!Yii::app()->user->isGuest),
                            
				array ('label'=>'Empresas',
                                    'url'=>array('/Empresa/index'),
                                    'visible'=>!Yii::app()->user->isGuest),
                                array ('label'=>'Sindicatos',
                                    'url'=>array('/Sindicato/index'),
                                    'visible'=>!Yii::app()->user->isGuest),
                             array ('label'=>'Nominas',
                                    'url'=>array('/nomina/index'),
                                    'visible'=>!Yii::app()->user->isGuest),
                            
                               array('label'=>'Clausuras'
					, 'url'=>array('Clausuras/index'),
					 'visible'=>!Yii::app()->user->isGuest),
                             
                              array('label'=>'Reportes'
					, 'url'=>'#'
					, 'visible'=>!Yii::app()->user->isGuest && Yii::app()->user->isSuperAdmin),
                            
				array('label'=>'Administrar Usuarios'
					, 'url'=>Yii::app()->user->ui->userManagementAdminUrl
					, 'visible'=>!Yii::app()->user->isGuest && Yii::app()->user->isSuperAdmin),
                                    array('label'=>'Respaldos BD'
					, 'url'=>'index.php?r=backup/default/index'
					, 'visible'=>!Yii::app()->user->isGuest && Yii::app()->user->isSuperAdmin),
                                        
                              
                            
                                array('label'=>'Iniciar Sessión'
					, 'url'=>Yii::app()->user->ui->loginUrl
					, 'visible'=>Yii::app()->user->isGuest),
                            
				array('label'=>'Cerrar Sesión ('.Yii::app()->user->name.')'
					, 'url'=>Yii::app()->user->ui->logoutUrl
					, 'visible'=>!Yii::app()->user->isGuest),
			),
		)); ?>
	</div><!-- mainmenu --> 
	<?php if(isset($this->breadcrumbs)):?>
		<?php $this->widget('zii.widgets.CBreadcrumbs', array(
			'links'=>$this->breadcrumbs,
		)); ?><!-- breadcrumbs -->
	<?php endif?>

	<?php echo $content; ?>

	<div class="clear"></div>

	<div id="footer">
		Copyleft &copy; <?php echo date('Y'); ?> Por MINPPPST.<br/>
		
		<?php echo Yii::powered(); ?>
	</div><!-- footer -->

</div><!-- page -->
<?php echo Yii::app()->user->ui->displayErrorConsole(); ?>
</body>
</html>
