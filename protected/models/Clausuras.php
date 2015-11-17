<?php

/**
 * This is the model class for table "clausuras".
 *
 * The followings are the available columns in table 'clausuras':
 * @property string $id
 * @property integer $numero_clausura
 * @property string $descripcion_clausura
 * @property string $cod_convencion
 *
 * The followings are the available model relations:
 * @property Convencion $codConvencion
 */
class Clausuras extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Clausuras the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'clausuras';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('numero_clausura, descripcion_clausura, cod_convencion', 'required'),
			array('numero_clausura', 'numerical', 'integerOnly'=>true),
			array('cod_convencion', 'length', 'max'=>20),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, numero_clausura, descripcion_clausura, cod_convencion', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'codConvencion' => array(self::BELONGS_TO, 'Convencion', 'cod_convencion'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'numero_clausura' => 'Numero Clausura',
			'descripcion_clausura' => 'Descripcion Clausura',
			'cod_convencion' => 'Cod Convencion',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('numero_clausura',$this->numero_clausura);
		$criteria->compare('descripcion_clausura',$this->descripcion_clausura,true);
		$criteria->compare('cod_convencion',$this->cod_convencion,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}