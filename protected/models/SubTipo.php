<?php

/**
 * This is the model class for table "sub_tipo".
 *
 * The followings are the available columns in table 'sub_tipo':
 * @property string $id
 * @property string $id_tipo_clausura
 * @property string $nombre_sub_tipo_clausura
 *
 * The followings are the available model relations:
 * @property Clausuras[] $clausurases
 * @property TipoClausura $idTipoClausura
 * @property VariableSubtipoClausura[] $variableSubtipoClausuras
 */
class SubTipo extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return SubTipo the static model class
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
		return 'sub_tipo';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_tipo_clausura, nombre_sub_tipo_clausura', 'required'),
			array('id_tipo_clausura', 'length', 'max'=>20),
			array('nombre_sub_tipo_clausura', 'length', 'max'=>255),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, id_tipo_clausura, nombre_sub_tipo_clausura', 'safe', 'on'=>'search'),
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
			'clausurases' => array(self::HAS_MANY, 'Clausuras', 'sub_tipo'),
			'idTipoClausura' => array(self::BELONGS_TO, 'TipoClausura', 'id_tipo_clausura'),
			'variableSubtipoClausuras' => array(self::HAS_MANY, 'VariableSubtipoClausura', 'id_subtipo'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'id_tipo_clausura' => 'Id Tipo Clausura',
			'nombre_sub_tipo_clausura' => 'Nombre Sub Tipo Clausura',
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
		$criteria->compare('id_tipo_clausura',$this->id_tipo_clausura,true);
		$criteria->compare('nombre_sub_tipo_clausura',$this->nombre_sub_tipo_clausura,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
        
          public function behaviors()
                {
                    return array(
                        // Classname => path to Class
                        'ActiveRecordLogableBehavior'=>
                            'application.behaviors.ActiveRecordLogableBehavior',
                    );
                }
}