<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
?>


<p>Buscar Convenciones Colectivas Relacionales.</p>
<?php
 ?>


<form method="get" >
Nombre: <input type="search" placeholder="Buscar" name="padre" 

value="<?=isset($_GET['padre']) ? CHtml::encode($_GET['padre']) : '' ; 

?>" />
<input type="submit" value="Buscar" />
</form>
<form method="get">
<?php 
//print_r($dataProvider); exit();
 $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'cambiar_padre',
       // 'emptyText' => 'No Se Han Encontrado Resultados',
        
));

?>

