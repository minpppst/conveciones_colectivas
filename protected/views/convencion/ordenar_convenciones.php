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

<?php 
 $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view_actualizar',
        'emptyText' => 'No Se Han Encontrado Resultados',
        'viewData'=>array('total'=>$total),
         
        
));

?>

