<?php
/* @var $this ClausurasController */
/* @var $model Clausuras */



$this->menu=array(
	array('label'=>'Listar Clausuras', 'url'=>array('index')),
	array('label'=>'Buscar Clausuras', 'url'=>array('admin')),
        array('label'=>'Crear Resumen Clausuras', 'url'=>array('resumenclausuras/create&convencion='.$_GET["convencion"])),
    
);
?>
<?php if(Yii::app()->user->hasFlash('success')):?>
    <div class="row">
        <h2 style="color:green;">   <?php echo Yii::app()->user->getFlash('success'); ?></h2>
    </div>
<?php endif; ?>
<?php if(Yii::app()->user->hasFlash('error')):?>
    <div class="row">
        <h2 style="color:red;">   <?php echo Yii::app()->user->getFlash('error'); ?></h2>
    </div>
<?php endif; ?>
<h1>Cargar Clausuras</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>
