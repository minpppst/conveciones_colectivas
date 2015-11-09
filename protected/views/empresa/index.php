<?php
/* @var $this EmpresaController */
/* @var $dataProvider CActiveDataProvider */

$this->menu=array(
	//array('label'=>'Create Empresa', 'url'=>array('create')),
	array('label'=>'Buscar Empresa', 'url'=>array('admin')),
);
?>

<h1>Empresas</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
